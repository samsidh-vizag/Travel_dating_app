import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class ButtonWidget extends StatelessWidget {
  final String assetName;
  const ButtonWidget({
    super.key,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    return Container(
      width: spaces.space_500,
      height: spaces.space_500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          spaces.space_100,
        ),
        color: colors.textSubtlest,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetName,
            color: colors.primary,
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }
}
