import 'package:flutter/material.dart';

import '../../constants.dart';
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
      padding: EdgeInsets.all(ConstScreen.largePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ContentTitle(
            title: 'PROJECTS',
            color: ConstColors.blue,
          ),
          Column(
              children: List.generate(
            1,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: ConstScreen.padding),
              child: Row(
                children: [
                  Visibility(
                    visible: index % 2 == 1,
                    child: const Spacer(),
                  ),
                  ProjectAnimatedBuilder(
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
