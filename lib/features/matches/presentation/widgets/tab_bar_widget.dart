import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class TabBarButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function()? onPressed;
  const TabBarButtonWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///color to use for the button
    final color = isSelected ? colors.primary : colors.secondary;

    ///fond size to use for the button
    final fontstyle = isSelected
        ? typography.h700.copyWith(color: colors.secondary)
        : typography.h600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: spaces.space_100,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(spaces.space_100),
            border: Border.all(
              color: colors.primary,
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: spaces.space_100, horizontal: spaces.space_300),
            child: Center(
              child: Text(
                text,
                style: fontstyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
