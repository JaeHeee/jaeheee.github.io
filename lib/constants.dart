import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConstColors {
  ConstColors._();

  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF8C8C8E);
  static const Color navy = Color(0xFF0F4C75);
  static const Color blue = Color(0xFF3282B8);
  static const Color lightBlue = Color(0xFFBBE1FA);
  static const Color white = Color(0xFFEEEEEE);
}

class ConstScreen {
  ConstScreen._();
  static double maxWidth = ScreenUtil().setWidth(1440.0);
  static double largePadding = ScreenUtil().setWidth(32.0);
  static double padding = ScreenUtil().setWidth(16.0);
  static double smallpadding = ScreenUtil().setWidth(8.0);
  static const duration = Duration(seconds: 1);
}
