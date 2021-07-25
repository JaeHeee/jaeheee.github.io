import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProjectAnimatedBuilder extends StatelessWidget {
  const ProjectAnimatedBuilder({
    Key key,
    @required ScrollController scrollController,
    @required this.isEven,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final bool isEven;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: _buildAnimatedContainer,
    );
  }

  Widget _buildAnimatedContainer(context, child) {
    RenderBox renderObject = context.findRenderObject();
    if (renderObject == null || !renderObject.hasSize) {
      return Container(
        width: ConstScreen.boxSize,
        height: ConstScreen.boxSize,
      );
    }
    final offsetY = renderObject?.localToGlobal(Offset.zero)?.dy ?? 0;
    final deviceHeight = MediaQuery.of(context).size.height;
    final heightVisible = deviceHeight - offsetY;
    final widgetHeight = renderObject?.size?.height;
    final howMuchShown = (heightVisible / widgetHeight).clamp(0, 1);
    final angle =
        isEven ? -(-0.5 + howMuchShown * 0.4) : -0.5 + howMuchShown * 0.4;

    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(angle * pi),
      alignment: Alignment.center,
      child: Container(
        width: ConstScreen.boxSize,
        height: ConstScreen.boxSize,
        color: ConstColors.blue.withOpacity(0.5),
        child: Center(
            child: Text(
          'Project',
          style: Theme.of(context).textTheme.headline1,
        )),
      ),
    );
  }
}
