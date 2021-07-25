import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutListGenerator extends StatelessWidget {
  const AboutListGenerator({
    @required this.title,
    @required this.subject,
    @required this.color,
    Key key,
  }) : super(key: key);

  final String title;
  final List<Map<String, String>> subject;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(80, 0, 0)
        ..setEntry(3, 2, 0.001)
        ..rotateY(-30 / 180 * pi),
      alignment: Alignment.centerLeft,
      child: Container(
        color: color,
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
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            _buildList(context),
          ],
        ),
      ),
    );
  }

  Column _buildList(BuildContext context) {
    return Column(
      children: List.generate((subject.length) * 2 - 1, (index) {
        if (index % 2 == 1) {
          return SizedBox(
            height: ConstScreen.smallpadding,
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: [
                  Text(
                    subject[index ~/ 2]['organization'],
                    style: Theme.of(context).textTheme.subtitle2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subject[index ~/ 2]['date'],
                    style: Theme.of(context).textTheme.overline,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                '  ${subject[index ~/ 2]['position']}',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          );
        }
      }),
    );
  }
}
