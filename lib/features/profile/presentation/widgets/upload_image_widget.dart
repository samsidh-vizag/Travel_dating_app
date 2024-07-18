import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/image_picker_widget.dart';

class UploadPhotWidget extends ConsumerWidget {
  final String identifier;
  const UploadPhotWidget({
    super.key,
    required this.identifier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///constants
    final assets = ref.watch(appAssetConstantsProvider);

    return Container(
      height: spaces.space_125 * 10,
      width: spaces.space_125 * 10,
      decoration: BoxDecoration(
          color: colors.secondary,
          border: Border.all(color: colors.primary, width: .5),
          borderRadius: BorderRadius.circular(spaces.space_100)),
      child: ImagePickerWidget(
        identifier: identifier,
        widgets: Center(
          child: CircleAvatar(
            backgroundColor: colors.primary,
            radius: spaces.space_150,
            child: SvgPicture.asset(
              assets.icAdd,
              // ignore: deprecated_member_use
              color: colors.secondary,
              height: spaces.space_150,
            ),
          ),
        ),
      ),
    );
  }
}
