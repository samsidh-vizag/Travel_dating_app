import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class DriverPageTabBarWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isSelected;
  const DriverPageTabBarWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///  text size to use for the button
    final textSize = isSelected
        ? typography.h700.copyWith(color: colors.primary)
        : typography.h500;
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            spaces.space_100,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
