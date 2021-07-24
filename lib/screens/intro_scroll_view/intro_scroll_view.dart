import 'package:flutter/material.dart';

import '../../constants.dart';
import 'unit/child_scroll_view.dart';

class IntoScrollView extends StatelessWidget {
  const IntoScrollView({
    Key key,
    @required ScrollController introTopController,
    @required ScrollController introBottomController,
  })  : _introTopController = introTopController,
        _introBottomController = introBottomController,
        super(key: key);

  final ScrollController _introTopController;
  final ScrollController _introBottomController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ConstScreen.largePadding),
      child: Column(
        children: [
          ChildScrollView(
            introController: _introTopController,
            text: 'HI I\'M JAEHEE KIM',
          ),
          ChildScrollView(
            introController: _introBottomController,
            text: 'MOBILE APP DEVELOPER',
            isTop: true,
          ),
        ],
      ),
    );
  }
}
