import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/profile_constants/edit_profile_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/image_picker_widget.dart';

class ImagePickerCircleWidget extends ConsumerWidget {
  const ImagePickerCircleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///constants
    final constants = ref.watch(editProfilePageConstantsProvider);
    final assets = ref.watch(appAssetConstantsProvider);

    return Stack(
      children: [
        Container(
          height: spaces.space_100 * 18,
          width: spaces.space_100 * 18,
          decoration: BoxDecoration(
            border: Border.all(color: colors.primary, width: .5),
            color: colors.secondary,
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            height: 40,
            width: 40,
            child: ImagePickerWidget(
              identifier: 'main',
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
        ),
      ],
    );
  }
}
