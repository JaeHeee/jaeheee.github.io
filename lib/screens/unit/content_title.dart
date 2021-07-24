import 'package:flutter/material.dart';

import '../../constants.dart';

class ContentTitle extends StatelessWidget {
  const ContentTitle({
    @required this.title,
    @required this.color,
    Key key,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: Theme.of(context).textTheme.headline1.copyWith(
                  height: 1.0,
                  color: color,
                ),
          ),
          TextSpan(
            text: '$title\n',
            style: Theme.of(context).textTheme.headline1.copyWith(
                  height: 0.7,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = ConstColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
