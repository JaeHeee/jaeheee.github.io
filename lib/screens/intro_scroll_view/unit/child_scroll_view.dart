import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChildScrollView extends StatelessWidget {
  const ChildScrollView({
    Key key,
    @required ScrollController introController,
    @required this.text,
    this.isTop = false,
  })  : _introController = introController,
        super(key: key);

  final ScrollController _introController;
  final String text;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _introController,
      physics: const NeverScrollableScrollPhysics(),
      reverse: isTop,
      scrollDirection: Axis.horizontal,
      child: Row(
        textDirection: isTop ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = ConstColors.blue,
                ),
          ),
        ],
      ),
    );
  }
}
