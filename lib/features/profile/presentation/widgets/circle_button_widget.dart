import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onPressed;
  const CircleButton({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            width: spaces.space_100 * 10,
            height: spaces.space_100 * 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.textSubtlest,
            ),
            child: Image.asset(image),
          ),
        ),
        Text(
          text,
          style: typography.h500,
        )
      ],
    );
  }
}
