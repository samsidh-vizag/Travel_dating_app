import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_asset_constants.g.dart';

final class AppAssetConstants {
  /// Prefix used for the app icons
  static const _iconsPath = 'assets/icons/ic_';

  final String icGoogle = '${_iconsPath}google_icon.svg';
  final String icFacebook = '${_iconsPath}facebook_icon.svg';
  final String icArrowBackward = '${_iconsPath}arrow_backward_icon.svg';
  final String icAddImage = '${_iconsPath}add_image_icon.svg';
  final String icAdd = '${_iconsPath}add_icon.svg';

  /// Prefix used for the app images
  static const _imagePath = 'assets/images/img_';

  final String icMale = '${_imagePath}male.png';
  final String icFemale = '${_imagePath}female.png';
  final String icReading = '${_imagePath}reading.png';
  final String icPhotography = '${_imagePath}photography.png';
  final String icGaming = '${_imagePath}gaming.png';
  final String icCharity = '${_imagePath}charity.png';
  final String icCooking = '${_imagePath}cooking.png';
  final String icMusic = '${_imagePath}music.png';
  final String icPainting = '${_imagePath}painting.png';
  final String icPets = '${_imagePath}pets.png';
  final String icPolitics = '${_imagePath}politics.png';
  final String icSports = '${_imagePath}sports.png';
  final String icTravel = '${_imagePath}travel.png';
  final String icFashion = '${_imagePath}fashion.png';
  final String imgBackgroundPhoto = '${_imagePath}backgoundphoto.png';
}

@riverpod
AppAssetConstants appAssetConstants(AppAssetConstantsRef ref) {
  return AppAssetConstants();
}
