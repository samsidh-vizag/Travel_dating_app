import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class FeaturesContainerWidget extends StatelessWidget {
  final String image;
  final String text;

  const FeaturesContainerWidget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Container(
      width: spaces.space_100 * 9,
      height: spaces.space_100 * 9,
      decoration: BoxDecoration(
        color: colors.textSubtlest,
        borderRadius: BorderRadius.circular(spaces.space_100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(
            text,
            style: typography.h400,
          ),
        ],
      ),
    );
  }
}
