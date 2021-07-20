import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 7,
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}
