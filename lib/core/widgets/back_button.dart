import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class BackArrowButton extends ConsumerWidget {
  const BackArrowButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(appAssetConstantsProvider);
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final boxShadow = AppTheme.of(context).boxShadow;
    return Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(spaces.space_100),
        onTap: () => context.pop(),
        child: Padding(
          padding: EdgeInsets.only(
            left: spaces.space_300,
            top: spaces.space_400,
          ),
          child: Container(
            width: spaces.space_500,
            height: spaces.space_500,
            decoration: BoxDecoration(
              color: colors.textSubtlest,
              boxShadow: [
                boxShadow.primary,
              ],
              borderRadius: BorderRadius.circular(spaces.space_100),
            ),
            child: Center(
              child: SvgPicture.asset(
                assets.icArrowBackward,
                height: spaces.space_200,
                // colorFilter:
                //     ColorFilter.mode(colors.primary, BlendMode.srcATop),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
