import 'package:flutter/material.dart';

import '../../constants.dart';

class TextNavButton extends StatelessWidget {
  const TextNavButton({
    @required this.text,
    @required this.globalKey,
    Key key,
  }) : super(key: key);

  final String text;
  final GlobalKey<State<StatefulWidget>> globalKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ConstScreen.padding),
      child: TextButton(
        style: ButtonStyle(
          textStyle:
              MaterialStateProperty.all(Theme.of(context).textTheme.headline6),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return ConstColors.blue;
              } else {
                return Colors.white;
              }
            },
          ),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          Scrollable.ensureVisible(
            globalKey.currentContext,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        },
        child: Text(
          text,
        ),
      ),
    );
  }
}

class TextLinkButton extends StatelessWidget {
  const TextLinkButton({
    @required this.text,
    @required this.onPressed,
    Key key,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
            Theme.of(context).textTheme.button.copyWith(height: 0.5)),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return ConstColors.blue;
            } else {
              return Colors.white;
            }
          },
        ),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
