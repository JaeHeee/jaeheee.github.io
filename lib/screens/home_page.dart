import 'package:flutter/material.dart';

import '../constants.dart';
import 'Side_menu/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(maxHeight: ConstScreen.maxWidth),
        child: Row(
          children: [
            const SideMenu(),
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
