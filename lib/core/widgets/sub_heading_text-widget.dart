// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class SubHeaddingTextWidget extends StatelessWidget {
  final String text;
  const SubHeaddingTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;

    return Padding(
      padding: EdgeInsets.only(
        left: spaces.space_400,
        right: spaces.space_400,
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: typography.h500,
      ),
    );
  }
}
