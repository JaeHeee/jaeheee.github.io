import 'package:flutter/material.dart';

import '../../constants.dart';
import '../unit/content_title.dart';

class AboutContainer extends StatelessWidget {
  const AboutContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const ContentTitle(
        title: 'ABOUT',
        color: ConstColors.navy,
      ),
    );
  }
}