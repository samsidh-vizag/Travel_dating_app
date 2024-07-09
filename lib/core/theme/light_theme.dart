import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_dating_app/core/theme/color_palette.dart';
import 'package:travel_dating_app/core/theme/extensions/box_shadow_extension.dart';
import 'package:travel_dating_app/core/theme/extensions/color_extension.dart';
import 'package:travel_dating_app/core/theme/extensions/space_extension.dart';
import 'package:travel_dating_app/core/theme/extensions/typography_extension.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      primary: AppColorPalettes.red400,
      secondary: AppColorPalettes.white500,
      text: AppColorPalettes.black500,
      textInverse: AppColorPalettes.grey400,
      textSubtle: AppColorPalettes.gray300,
      textSubtlest: AppColorPalettes.red300,
      textDisabled: AppColorPalettes.red100,
      bottomNavBorder: AppColorPalettes.grey350.withOpacity(0.2),
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalettes.black500,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalettes.grey400,
    ),
    AppBoxShadowExtension(
        primary: BoxShadow(
          blurRadius: 34,
          spreadRadius: -10,
          color: Colors.black.withOpacity(0.1),
        ),
        secondary: BoxShadow(
          blurRadius: 20,
          spreadRadius: -10,
          color: Colors.black.withOpacity(0.2),
        ))
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
