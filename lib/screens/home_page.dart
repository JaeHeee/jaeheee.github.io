import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'about/about_container.dart';
import 'contact/contact_container.dart';
import 'projects/projects_container.dart';
import 'unit/text_buttons.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final Map<String, GlobalKey> _globalKeys = {};
  final List<String> _navigatorList = ['ABOUT', 'PROJECTS', 'CONTACT'];

  @override
  Widget build(BuildContext context) {
    for (var item in _navigatorList) {
      _globalKeys[item] = GlobalKey();
    }

    return Scaffold(
      body: Container(
          constraints: BoxConstraints(maxHeight: ConstScreen.maxWidth),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildNavigator(),
                _buildBody(context),
                _buildBottomCopyright,
              ],
            ),
          )),
    );
  }

  Padding _buildNavigator() {
    return Padding(
      padding: EdgeInsets.all(ConstScreen.padding),
      child: Row(
        children: [
          AnimatedTextKit(
            totalRepeatCount: 2,
            animatedTexts: [
              TyperAnimatedText('JAEHEE KIM\nMOBILE APPLICATION DEVELOPER')
            ],
          ),
          const Spacer(),
          ..._buildTextNavButtons,
        ],
      ),
    );
  }

  List<Widget> get _buildTextNavButtons =>
      List.generate(_navigatorList.length, (index) {
        final text = _navigatorList[index];
        return TextNavButton(
          text: text,
          globalKey: _globalKeys[text],
        );
      });

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
        AboutContainer(
          key: _globalKeys['ABOUT'],
        ),
        ProjectsContainer(
          key: _globalKeys['PROJECTS'],
        ),
        ContactContainer(
          key: _globalKeys['CONTACT'],
        ),
      ],
    );
  }

  Padding get _buildBottomCopyright => Padding(
        padding: EdgeInsets.symmetric(vertical: ConstScreen.largePadding),
        child: const Text(
          'Copyright © 2021 | All rights reserved. | JAEHEE KIM',
        ),
      );
}
