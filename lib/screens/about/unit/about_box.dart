import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../models/about.dart';
import 'about_list_generator.dart';
import 'skill_list_generator.dart';

class AboutBox extends StatelessWidget {
  AboutBox({
    Key key,
    @required TabController tabController,
    @required this.page,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final int page;

  @override
  Widget build(BuildContext context) {
    var nextPage = page;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        _buildContents(context),
        _buildCircle,
        _buildClickButton(
          context,
          nextPage,
        ),
      ],
    );
  }

  Container _buildContents(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(100.0),
      height: ConstScreen.boxSize,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildThisIsBox(context),
          ..._buildAboutList,
          _buildSkill(context),
        ],
      ),
    );
  }

  Container _buildThisIsBox(BuildContext context) => Container(
        width: 100,
        height: 100,
        color: ConstColors.black,
        child: Center(
          child: Text.rich(
            TextSpan(
              text: 'THIS IS\n',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              children: [
                TextSpan(
                  text: 'ME',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontWeight: FontWeight.w500,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = ConstColors.navy,
                      ),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );

  List<Widget> get _buildAboutList {
    final _aboutColorList = <Color>[
      ConstColors.navy.withOpacity(0.2),
      ConstColors.navy.withOpacity(0.3),
      ConstColors.navy.withOpacity(0.5),
      ConstColors.navy.withOpacity(0.7),
    ];

    return List.generate(
        aboutMap.length - 1,
        (index) => AboutListGenerator(
              title: aboutMap.keys.toList()[index],
              subject: aboutMap.values.toList()[index],
              color: _aboutColorList[index],
            ));
  }

  Widget _buildSkill(BuildContext context) {
    final languages = aboutMap['SKILLS']['language'].keys.toList();
    final languageScores = aboutMap['SKILLS']['language'].values.toList();
    final frameWorks = aboutMap['SKILLS']['framework'].keys.toList();
    final frameWorkScores = aboutMap['SKILLS']['framework'].values.toList();

    return Transform(
      transform: Matrix4.translationValues(80, 0, 0)
        ..setEntry(3, 2, 0.001)
        ..rotateY(-30 / 180 * pi),
      alignment: Alignment.centerLeft,
      child: Container(
        color: ConstColors.navy.withOpacity(0.7),
        padding: EdgeInsets.only(
          top: ConstScreen.padding,
          left: ConstScreen.padding,
          right: ConstScreen.padding,
          bottom: ConstScreen.largePadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'SKILLS',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SkillListGenerator(
                  skills: languages,
                  scores: languageScores,
                ),
                SkillListGenerator(
                  skills: frameWorks,
                  scores: frameWorkScores,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox get _buildCircle => SizedBox(
        width: ConstScreen.boxSize,
        height: ConstScreen.boxSize,
        child: const CircularProgressIndicator(
          backgroundColor: ConstColors.lightBlue,
          strokeWidth: 1,
          value: 0,
        ),
      );

  Positioned _buildClickButton(BuildContext context, int nextPage) {
    return Positioned(
      bottom: 100,
      child: TextButton(
        style: ButtonStyle(
          textStyle:
              MaterialStateProperty.all(Theme.of(context).textTheme.button),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return ConstColors.blue;
              } else {
                return ConstColors.lightBlue;
              }
            },
          ),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          if (nextPage > aboutMap.length - 1) {
            nextPage = 0;
          } else {
            nextPage += 1;
          }
          _tabController.animateTo(
            nextPage,
            duration: ConstScreen.duration,
            curve: Curves.ease,
          );
        },
        child: const Text('CLICK'),
      ),
    );
  }
}
