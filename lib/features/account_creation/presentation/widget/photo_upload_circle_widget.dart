import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class PhotoUploadCircleWidget extends ConsumerWidget {
  final double width;
  final double height;
  final double radius;
  final double iconSize;
  const PhotoUploadCircleWidget({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///constants
    final assets = ref.watch(appAssetConstantsProvider);

    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(spaces.space_100 * 11),
      dashPattern: [spaces.space_50, spaces.space_50],
      color: colors.primary,
      strokeWidth: 1,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: colors.secondary,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: colors.primary,
            radius: radius,
            child: SvgPicture.asset(
              assets.icAdd,
              // ignore: deprecated_member_use
              color: colors.secondary,
              height: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
