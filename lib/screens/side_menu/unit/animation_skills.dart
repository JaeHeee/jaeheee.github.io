import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/profile.dart';

class AnimationSkills extends StatelessWidget {
  const AnimationSkills({
    @required this.skill,
    @required this.percentage,
    @required this.color,
    Key key,
  }) : super(key: key);

  final String skill;
  final String percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate((skills[skill].length) * 2 - 1, (index) {
      if (index % 2 == 1) {
        return const SizedBox(
          width: ConstScreen.paddingSize,
        );
      } else {
        return Expanded(
          child: _buildSkillProgressBar(
            context,
            skill: skills[skill][index ~/ 2],
            percentage: skills[percentage][index ~/ 2],
            color: color,
          ),
        );
      }
    }));
  }
}

Widget _buildSkillProgressBar(
  BuildContext context, {
  @required String skill,
  @required double percentage,
  @required Color color,
}) {
  return Column(
    children: [
      AspectRatio(
        aspectRatio: 1.0,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: percentage),
          duration: ConstScreen.duration,
          builder: (context, double value, child) => Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: value,
                color: color,
                backgroundColor: ConstColors.lightBlack,
              ),
              Center(
                child: Text(
                  '${(value * 100).toInt().toString()} %',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: ConstScreen.paddingSize,
      ),
      Text(
        skill,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    ],
  );
}
