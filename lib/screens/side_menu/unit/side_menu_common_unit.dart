import 'package:flutter/material.dart';

import '../../../constants.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: ConstScreen.paddingSize,
      ),
      child: Divider(),
    );
  }
}

class ProfileListGenerator extends StatelessWidget {
  const ProfileListGenerator({
    @required this.subject,
    Key key,
  }) : super(key: key);

  final List<Map<String, String>> subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate((subject.length) * 2 - 1, (index) {
        if (index % 2 == 1) {
          return const SizedBox(
            height: ConstScreen.paddingSize,
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subject[index ~/ 2]['organization'],
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    subject[index ~/ 2]['date'],
                    style: Theme.of(context).textTheme.overline,
                  ),
                ],
              ),
              Text(
                '  ${subject[index ~/ 2]['position']}',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          );
        }
      }),
    );
  }
}
