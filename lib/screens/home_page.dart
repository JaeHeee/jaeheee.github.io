import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'about/about_container.dart';
import 'contact/contact_container.dart';
import 'intro_scroll_view/intro_scroll_view.dart';
import 'projects/projects_container.dart';
import 'unit/text_buttons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  ScrollController _introTopController;
  ScrollController _introBottomController;

  final Map<String, GlobalKey> _globalKeys = {};
  final List<String> _navigatorList = ['ABOUT', 'PROJECTS', 'CONTACT'];

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    _introTopController = ScrollController();
    _introBottomController = ScrollController();

    makeGlobalKeys();
    super.initState();
  }

  void _scrollListener() {
    _introTopController.jumpTo(
      _scrollController.offset,
    );
    _introBottomController.jumpTo(
      _scrollController.offset,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _introTopController.dispose();
    _introBottomController.dispose();
    super.dispose();
  }

  void makeGlobalKeys() {
    for (var item in _navigatorList) {
      _globalKeys[item] = GlobalKey();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints(maxHeight: ConstScreen.maxWidth),
          child: SingleChildScrollView(
            controller: _scrollController,
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
        IntoScrollView(
          introTopController: _introTopController,
          introBottomController: _introBottomController,
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
          textAlign: TextAlign.center,
        ),
      );
}
