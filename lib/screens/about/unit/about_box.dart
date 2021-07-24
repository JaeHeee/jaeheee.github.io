import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../models/about.dart';
import 'about_list_generator.dart';

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
      height: ScreenUtil().setWidth(120.0),
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildEmptyBox,
          ..._buildAboutList,
          _buildSkill(context),
        ],
      ),
    );
  }

  Container get _buildEmptyBox => Container(
        width: 100,
        height: 100,
        color: ConstColors.black,
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

  Container _buildSkill(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: ConstColors.navy.withOpacity(0.7),
      child: Center(
        child: Text(
          'SKILLS',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }

  SizedBox get _buildCircle => SizedBox(
        width: ScreenUtil().setWidth(120.0),
        height: ScreenUtil().setWidth(120.0),
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
