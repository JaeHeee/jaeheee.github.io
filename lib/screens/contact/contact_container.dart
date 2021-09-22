import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../../models/profile.dart';
import '../unit/content_title.dart';
import '../unit/text_buttons.dart';

class ContactContainer extends StatelessWidget {
  const ContactContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: ConstScreen.largePadding(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContentTitle(
            title: 'CONTACT',
            color: ConstColors.lightBlue,
          ),
          _buildContactContents(context),
        ],
      ),
    );
  }

  Column _buildContactContents(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(contacts.length, (index) {
          final text = contacts[index].keys.first;

          final linkText = contacts[index].values.first['text'];
          String linkUrl;
          if (text == 'EMAIL') {
            final emailLaunchUri = Uri(
                scheme: 'mailto',
                path: contacts[index].values.first['url'],
                query: encodeQueryParameters(<String, String>{'subject': ''}));
            linkUrl = emailLaunchUri.toString();
          }
          linkUrl = contacts[index].values.first['url'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text.toString(),
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TextLinkButton(
                text: linkText,
                onPressed: () => _launchURL(linkUrl),
              ),
              SizedBox(height: ConstScreen.smallpadding)
            ],
          );
        }));
  }

  String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
