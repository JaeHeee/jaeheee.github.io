import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: 'JaeHeee.github.io',
        theme: ThemeData(
          fontFamily: 'Archivo',
          textTheme: Theme.of(context).textTheme.copyWith(
                headline1: const TextStyle(color: ConstColors.white),
                headline2: const TextStyle(color: ConstColors.white),
                headline3: const TextStyle(color: ConstColors.white),
                headline4: const TextStyle(color: ConstColors.white),
                headline5: const TextStyle(color: ConstColors.white),
                headline6: const TextStyle(color: ConstColors.white),
                subtitle1: const TextStyle(color: ConstColors.white),
                subtitle2: const TextStyle(color: ConstColors.white),
                bodyText1: const TextStyle(color: ConstColors.white),
                bodyText2: const TextStyle(color: ConstColors.white),
                caption: const TextStyle(color: ConstColors.white),
                button: const TextStyle(color: ConstColors.white),
                overline: const TextStyle(color: ConstColors.white),
              ),
        ).copyWith(
          primaryColor: ConstColors.black,
          scaffoldBackgroundColor: ConstColors.black,
        ),
        home: HomePage(),
      ),
    );
  }
}
