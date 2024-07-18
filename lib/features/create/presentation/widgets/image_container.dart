import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/account_creation_contants/upload_photo_page_constants.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/image_picker_widget.dart';

class ImageContainer extends ConsumerWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(uploadPhotoPageConstantsProvider);
    final assets = ref.watch(appAssetConstantsProvider);

    return Padding(
      padding: EdgeInsets.all(spaces.space_300),
      child: Container(
        width: double.infinity,
        height: spaces.space_400 * 6,
        decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: BorderRadius.circular(
            spaces.space_150,
          ),
          border: Border.all(
            color: colors.textSubtlest,
            width: .6,
          ),
        ),
        child: ImagePickerWidget(
          identifier: 'trip',
          widgets: SizedBox(
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
    );
  }
}
