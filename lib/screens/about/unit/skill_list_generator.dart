import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../constants.dart';

class SkillListGenerator extends StatelessWidget {
  const SkillListGenerator({
    Key key,
    @required this.skills,
    @required this.scores,
  }) : super(key: key);

  final List<String> skills;
  final List<int> scores;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        skills.length,
        (index) => Padding(
          padding: EdgeInsets.all(ConstScreen.extraSmallpadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skills[index],
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 6.0),
              StepProgressIndicator(
                totalSteps: 7,
                currentStep: scores[index],
                size: 5,
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ConstColors.white,
                    scores[index] == 7
                        ? ConstColors.white
                        : ConstColors.white.withOpacity(0.7)
                  ],
                ),
                unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ConstColors.white.withOpacity(0.3),
                    ConstColors.navy.withOpacity(0.7)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
