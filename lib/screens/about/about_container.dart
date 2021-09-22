import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/about.dart';
import '../unit/content_title.dart';
import 'unit/about_box.dart';

class AboutContainer extends StatefulWidget {
  const AboutContainer({Key key}) : super(key: key);

  @override
  _AboutContainerState createState() => _AboutContainerState();
}

class _AboutContainerState extends State<AboutContainer>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _page;

  @override
  void initState() {
    _page = 0;
    _tabController = TabController(vsync: this, length: aboutMap.length + 1);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: ConstScreen.largePadding(context)),
      child: Column(
        children: [
          const ContentTitle(
            title: 'ABOUT',
            color: ConstColors.navy,
          ),
          AboutBox(
            tabController: _tabController,
            page: _page,
          ),
        ],
      ),
    );
  }
}
