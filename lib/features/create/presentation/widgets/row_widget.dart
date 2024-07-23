import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class RowWidget extends StatelessWidget {
  final String text;
  final String value;
  const RowWidget({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    ///theme
    final typography = AppTheme.of(context).typography;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: typography.h600,
        ),
        Text(
          value,
          style: typography.h500,
        ),
      ],
    );
  }
}
