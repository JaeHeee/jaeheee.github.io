import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class ProjectAnimatedBuilder extends StatelessWidget {
  const ProjectAnimatedBuilder({
    Key key,
    @required this.projects,
    @required ScrollController scrollController,
    @required this.isEven,
  })  : _scrollController = scrollController,
        super(key: key);

  final Map<String, String> projects;
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              projects['image'],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  projects['title'],
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(projects['description'],
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _launchURL(
                            projects['appStore'],
                          );
                        },
                        iconSize: 50,
                        icon: SvgPicture.asset(
                          'assets/icons/ios.svg',
                          width: 50,
                          color: ConstColors.white.withOpacity(0.9),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchURL(
                            projects['playStore'],
                          );
                        },
                        iconSize: 50,
                        icon: SvgPicture.asset(
                          'assets/icons/android.svg',
                          width: 50,
                          color: ConstColors.white.withOpacity(0.9),
                        ),
                      ),
                      Visibility(
                        visible: projects['github'] != '',
                        child: IconButton(
                          onPressed: () {
                            _launchURL(
                              projects['github'],
                            );
                          },
                          iconSize: 50,
                          icon: SvgPicture.asset(
                            'assets/icons/github.svg',
                            width: 50,
                            color: ConstColors.white.withOpacity(0.9),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
