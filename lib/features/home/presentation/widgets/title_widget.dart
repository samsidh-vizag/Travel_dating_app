import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.typography.h700.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "See More",
          style: theme.typography.h500.copyWith(
            color: theme.colors.primary,
          ),
        ),
      ],
    );
  }
}
