import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_asset_constants.g.dart';

final class AppAssetConstants {
  /// Prefix used for the app icons
  static const _iconsPath = 'assets/icons/ic_';

  final String icGoogle = '${_iconsPath}google_icon.svg';
  final String icFacebook = '${_iconsPath}facebook_icon.svg';
  final String icArrowBackward = '${_iconsPath}arrow_backward_icon.svg';

  /// Prefix used for the app images
  static const _imagePath = 'assets/images/img_';

  final String icMale = '${_imagePath}male.png';
  final String icFemale = '${_imagePath}female.png';
}

@riverpod
AppAssetConstants appAssetConstants(AppAssetConstantsRef ref) {
  return AppAssetConstants();
}
