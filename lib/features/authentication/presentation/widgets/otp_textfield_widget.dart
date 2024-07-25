import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class OtpTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const OtpTextFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    return SizedBox(
      height: spaces.space_600,
      width: spaces.space_600,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: typography.h500.copyWith(color: colors.textInverse),
        decoration: InputDecoration(
          counterText: '',
          hintText: '',
          hintStyle: typography.h500.copyWith(color: colors.textInverse),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spaces.space_100),
            borderSide: BorderSide(color: colors.textSubtlest, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(spaces.space_100),
            borderSide: BorderSide(color: colors.primary, width: 1),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            nextFocusNode!.requestFocus();
          }
        },
      ),
    );
  }
}
