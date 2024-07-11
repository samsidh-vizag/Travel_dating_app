import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;
  const PageTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.typography.h800.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: theme.spaces.space_400,
          ),
        ),
      ],
    );
  }
}
