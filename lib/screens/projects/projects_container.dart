import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/projects.dart';
import '../unit/content_title.dart';
import 'unit/project_animated_builder.dart';

class ProjectsContainer extends StatelessWidget {
  const ProjectsContainer({
    @required ScrollController scrollController,
    Key key,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ConstScreen.largePadding(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ContentTitle(
            title: 'PROJECTS',
            color: ConstColors.blue,
          ),
          Column(
              children: List.generate(
            projects.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: ConstScreen.padding),
              child: Row(
                children: [
                  Visibility(
                    visible:
                        index % 2 == 1 && !ConstScreen.isTabletWidth(context),
                    child: const Spacer(),
                  ),
                  ProjectAnimatedBuilder(
                    projects: projects[index],
                    scrollController: _scrollController,
                    isEven: index % 2 == 1,
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
