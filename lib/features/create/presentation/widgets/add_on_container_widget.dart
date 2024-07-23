import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class AddOnContainerWidget extends StatelessWidget {
  final String image;
  final String text;
  final void Function()? onTap;
  const AddOnContainerWidget({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ///theme
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width / 2.5,
        height: MediaQuery.sizeOf(context).width / 2.5,
        decoration: BoxDecoration(
            color: colors.textSubtlest,
            borderRadius: BorderRadius.circular(
              spaces.space_125,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            Text(
              text,
              style: typography.h600,
            )
          ],
        ),
      ),
    );
  }
}
