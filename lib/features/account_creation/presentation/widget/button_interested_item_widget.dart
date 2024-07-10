import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class ButtonInterestedItemWidget extends StatelessWidget {
  final bool isSelected;
  final String buttonText;
  final String icon;
  final void Function()? onPressed;
  const ButtonInterestedItemWidget(
      {super.key,
      required this.isSelected,
      required this.buttonText,
      required this.onPressed,
      required this.icon});

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

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            spaces.space_100,
          ),
          border: Border.all(
            color: colors.primary,
            width: borderWidth,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_150),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(icon),
              ),
            ),
            Text(
              buttonText,
              style: fontstyle,
            )
          ],
        ),
      ),
    );
  }
}
