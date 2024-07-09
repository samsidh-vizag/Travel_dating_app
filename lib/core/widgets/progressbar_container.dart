import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class ProgressbarContainer extends StatelessWidget {
  final Color stepOne;
  final Color stepTwo;
  final Color stepThree;
  final Color stepFour;
  final Color stepFive;

  const ProgressbarContainer(
      {super.key,
      required this.stepOne,
      required this.stepTwo,
      required this.stepThree,
      required this.stepFour,
      required this.stepFive});

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: spaces.space_100,
          backgroundColor: stepOne,
        ),
        CircleAvatar(
          radius: spaces.space_100,
          backgroundColor: stepTwo,
        ),
        CircleAvatar(
          radius: spaces.space_100,
          backgroundColor: stepThree,
        ),
        CircleAvatar(
          radius: spaces.space_100,
          backgroundColor: stepFour,
        ),
        CircleAvatar(
          radius: spaces.space_100,
          backgroundColor: stepFour,
        ),
      ],
    );
  }
}
