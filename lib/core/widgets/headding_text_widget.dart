import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class HeaddingTextWidget extends StatelessWidget {
  final String text;
  const HeaddingTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;

    return Padding(
      padding: EdgeInsets.only(
        left: spaces.space_800,
        right: spaces.space_800,
        top: spaces.space_500,
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: typography.h900,
      ),
    );
  }
}
