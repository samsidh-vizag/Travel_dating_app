import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class TextFieldAndTitleWidget extends ConsumerWidget {
  final String textFieldTitle;
  final String hintText;
  final TextEditingController controller;
  final int? maxLines;
  final bool enabled;
  final bool expands;

  const TextFieldAndTitleWidget({
    super.key,
    required this.enabled,
    required this.textFieldTitle,
    required this.hintText,
    required this.controller,
    this.maxLines,
    this.expands = false,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: apptheme.spaces.space_300,
        vertical: apptheme.spaces.space_200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textFieldTitle,
            style: apptheme.typography.h600,
          ),
          SizedBox(
            height: AppTheme.of(context).spaces.space_100,
          ),
          TextField(
            enabled: enabled,
            style: apptheme.typography.ui,
            textAlign: TextAlign.justify,
            controller: controller,
            maxLines: maxLines,
            expands: expands,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: apptheme.typography.h500
                  .copyWith(color: apptheme.colors.textInverse),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(apptheme.spaces.space_100),
                  borderSide: BorderSide(
                      color: apptheme.colors.textSubtlest, width: 1)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(apptheme.spaces.space_100),
                borderSide:
                    BorderSide(color: apptheme.colors.primary, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
