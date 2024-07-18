import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/profile_constants/profile_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class ProfileImageWidget extends ConsumerWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(profilePageConstantsProvider);
    final assets = ref.watch(appAssetConstantsProvider);

    return Stack(
      children: [
        SizedBox(
          width: spaces.space_500 * 4.1,
          height: spaces.space_500 * 4.1,
          child: CircularProgressIndicator(
            strokeWidth: spaces.space_100,
            value: 0.5, // 70% progress
            backgroundColor: colors.textSubtlest,
            valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            height: spaces.space_100 * 18,
            width: spaces.space_100 * 18,
            decoration: BoxDecoration(
              color: colors.secondary,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    assets.icAddImage,
                    // ignore: deprecated_member_use
                    color: colors.primary,
                  ),
                  Text(constants.txtAddImage),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(spaces.space_900),
                gradient: LinearGradient(
                  colors: [colors.primary, colors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: spaces.space_300, vertical: spaces.space_100),
                child: Text(
                  '50% ${constants.txtComplete}',
                  style: typography.h600.copyWith(color: colors.secondary),
                ),
              ),
            ))
      ],
    );
  }
}
