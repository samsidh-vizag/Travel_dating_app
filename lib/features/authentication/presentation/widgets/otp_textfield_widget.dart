import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class OtpTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const OtpTextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    return SizedBox(
      height: spaces.space_700,
      width: spaces.space_700,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: '___',
          hintStyle: typography.h500.copyWith(color: colors.textInverse),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spaces.space_100),
              borderSide: BorderSide(color: colors.textSubtlest, width: 1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spaces.space_100),
            borderSide: BorderSide(color: colors.primary, width: 1),
          ),
        ),
      ),
    );
  }
}
