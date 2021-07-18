import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JaeHeee.github.io',
      theme: ThemeData.dark().copyWith(
        primaryColor: ConstColors.orange,
        backgroundColor: ConstColors.mainBlack,
        canvasColor: ConstColors.mainBlack,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: ConstColors.white)
            .copyWith(
              caption: const TextStyle(color: ConstColors.white),
            ),
      ),
      home: const HomePage(),
    );
  }
}
