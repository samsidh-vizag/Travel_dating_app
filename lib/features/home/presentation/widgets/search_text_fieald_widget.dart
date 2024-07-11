import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class SearchTextfieldWidget extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;

  const SearchTextfieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;

    return SizedBox(
      width: spaces.space_500 * 8,
      height: spaces.space_500,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: typography.h500.copyWith(color: colors.textInverse),
          prefixIcon: prefixIcon,
          fillColor: colors.textSubtlest,
          filled: true,
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
