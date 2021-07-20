import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../../models/profile.dart';
import '../side_menu/unit/animation_skills.dart';
import '../side_menu/unit/side_menu_common_unit.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProfile(context),
              _buildCV(context),
            ],
          ),
        ));
  }

  Expanded _buildCV(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: ConstScreen.paddingSize),
      child: Column(
        children: [
          _buildWorkExperience(context),
          const CommonDivider(),
          _buildEducation(context),
          const CommonDivider(),
          _buildExtraActivity(context),
          const CommonDivider(),
          _buildSkills(context),
          const CommonDivider(),
          _buildContact(context),
        ],
      ),
    ));
  }

  Column _buildContact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: ConstScreen.paddingSize),
          child: Text(
            'Contact',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ConstColors.lightBlack,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: _buildIconButtons(context),
        ),
        const SizedBox(height: ConstScreen.paddingSize),
      ],
    );
  }

  Row _buildIconButtons(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Spacer(),
        IconButton(
          onPressed: () => _launchURL('https://github.com/JaeHeee'),
          icon: SvgPicture.asset('assets/icons/github.svg'),
        ),
        IconButton(
          onPressed: () =>
              _launchURL('https://www.linkedin.com/in/jaehee-kim-18a298210/'),
          icon: SvgPicture.asset('assets/icons/linkedin.svg'),
        ),
        IconButton(
          onPressed: () {
            final emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'jaehee.k.dev@gmail.com',
                query: encodeQueryParameters(<String, String>{'subject': ''}));
            _launchURL(emailLaunchUri.toString());
          },
          icon: const Icon(Icons.mail),
          color: ConstColors.grey,
        ),
        IconButton(
          iconSize: 48,
          onPressed: () => _launchURL('https://velog.io/@kjha2142'),
          icon: Text(
            'Velog',
            style: Theme.of(context).textTheme.button.copyWith(
                  color: ConstColors.grey,
                ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  Column _buildEducation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: ConstScreen.paddingSize),
          child: Text(
            'Education',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        ProfileListGenerator(
          subject: education,
        ),
      ],
    );
  }

  Column _buildExtraActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: ConstScreen.paddingSize),
          child: Text(
            'Extracurricular Activity',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        ProfileListGenerator(
          subject: extracurricular,
        ),
      ],
    );
  }

  Column _buildWorkExperience(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: ConstScreen.paddingSize),
          child: Text(
            'Work Experience',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        ProfileListGenerator(
          subject: workExperience,
        ),
      ],
    );
  }

  Column _buildSkills(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: ConstScreen.paddingSize),
          child: Text(
            'Skills',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Column(
          children: [
            const AnimationSkills(
              skill: 'language',
              percentage: 'language_percentage',
              color: ConstColors.orange,
            ),
            const SizedBox(
              height: ConstScreen.paddingSize,
            ),
            const AnimationSkills(
              skill: 'framework',
              percentage: 'framework_percentage',
              color: ConstColors.yellow,
            ),
          ],
        ),
      ],
    );
  }

  Padding _buildProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstScreen.paddingSize),
      child: Container(
        decoration: BoxDecoration(
          color: ConstColors.lightBlack,
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.all(ConstScreen.paddingSize),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(ConstScreen.paddingSize),
              child: CircleAvatar(
                radius: 50,
                // backgroundImage: AssetImage(
                //   profile['image'],
                // ),
              ),
            ),
            Text(
              profile['name'],
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              profile['position'],
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              profile['bio'],
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
