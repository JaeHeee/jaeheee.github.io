import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';
import 'side_menu/side_menu.dart';
import 'main_screen/main_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(maxHeight: ConstScreen.maxWidth),
        child: Row(
          children: [
            if (Responsive.isDesktop(context)) const SideMenu(),
            const MainScreen()
          ],
        ),
      ),
    );
  }
}
