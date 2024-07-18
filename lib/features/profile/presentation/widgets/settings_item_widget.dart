import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class SettingsItemWidget extends StatelessWidget {
  final String text;
  final String image;

  const SettingsItemWidget({
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

    return Padding(
      padding: EdgeInsets.symmetric(vertical: spaces.space_100),
      child: Row(
        children: [
          SizedBox(
            width: spaces.space_300,
            height: spaces.space_300,
            child: Image.asset(
              image,
              color: colors.primary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: spaces.space_300),
            child: Text(
              text,
              style: typography.h500,
            ),
          )
        ],
      ),
    );
  }
}
