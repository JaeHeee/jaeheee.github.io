import 'package:flutter/material.dart';
import 'package:jaeheee_github_io/constants.dart';

import '../unit/content_title.dart';

class ProjectsContainer extends StatelessWidget {
  const ProjectsContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const ContentTitle(
        title: 'PROJECTS',
        color: ConstColors.blue,
      ),
    );
  }
}
