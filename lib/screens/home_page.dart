import 'package:flutter/material.dart';

import '../constants.dart';
import 'about/about_container.dart';
import 'contact/contact_container.dart';
import 'projects/projects_container.dart';
import 'unit/text_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints(maxHeight: ConstScreen.maxWidth),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildNavigator(),
                _buildBody(context),
              ],
            ),
          )),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: Wrap(children: [
            Text(
              'HI',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = ConstColors.white,
                  ),
            )
          ]),
        ),
        const AboutContainer(),
        const ProjectsContainer(),
        const ContactContainer(),
      ],
    );
  }

  Padding _buildNavigator() {
    return Padding(
      padding: EdgeInsets.all(ConstScreen.padding),
      child: Row(
        children: [
          const Text('JAEHEE KIM\nMOBILE APPLICATION DEVELOPER'),
          const Spacer(),
          const TextNavButton(text: 'ABOUT'),
          const TextNavButton(text: 'PROJECTS'),
          const TextNavButton(text: 'CONTACT'),
        ],
      ),
    );
  }
}
