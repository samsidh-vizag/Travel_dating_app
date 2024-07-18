import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class ButtonContainerWidget extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onTap;
  const ButtonContainerWidget({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            Container(
              width: spaces.space_500 * 3.5,
              height: spaces.space_500 * 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colors.textSubtlest,
              ),
              child: Center(
                child: Image.asset(image),
              ),
            ),
            Text(
              text,
              style: typography.h500,
            ),
          ],
        ),
      ),
    );
  }
}
