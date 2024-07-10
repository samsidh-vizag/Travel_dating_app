import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class TabWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function()? onPressed;
  const TabWidget({
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

    ///border width to use for the button
    final double borderWidth = isSelected ? 2 : 0.5;

    ///fond size to use for the button
    final fontstyle = isSelected ? typography.h700 : typography.h600;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: spaces.space_300, vertical: spaces.space_100),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(spaces.space_100),
            border: Border.all(
              color: colors.primary,
              width: borderWidth,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: spaces.space_300, vertical: spaces.space_200),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: fontstyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
