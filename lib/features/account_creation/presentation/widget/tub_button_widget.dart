import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class TabButtonWidget extends HookConsumerWidget {
  final String buttonText;
  final String imageText;
  final bool isSelected;
  final void Function()? onPressed;

  const TabButtonWidget(
      {super.key,
      required this.buttonText,
      required this.isSelected,
      required this.onPressed,
      required this.imageText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Themedata
    final spaces = AppTheme.of(context).spaces;
    final color = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;

    /// Background color to use for the button
    final bgColor = isSelected ? color.primary : color.textSubtlest;

    return Padding(
      padding: EdgeInsets.only(right: spaces.space_200),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: 80,
          height: 70,
          child: Column(
            children: [
              Image.asset(
                imageText,
                color: bgColor,
              ),
              Text(
                buttonText,
                style: typography.h600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
