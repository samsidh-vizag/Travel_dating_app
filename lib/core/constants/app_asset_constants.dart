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
  final String icSave = '${_iconsPath}save.svg';
  final String icEmail = '${_iconsPath}email.svg';
  final String icTwitter = '${_iconsPath}twitter.svg';
  final String icPhone = '${_iconsPath}phone.svg';

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
  final String imgLocation = '${_imagePath}location.png';
  final String icHome = '${_imagePath}home.png';
  final String icChat = '${_imagePath}chat.png';
  final String icHeart = '${_imagePath}heart.png';
  final String icAdds = '${_imagePath}add.png';
  final String icNotification = '${_imagePath}notification.png';
  final String icFilter = '${_imagePath}filter.png';
  final String icHeartWhite = '${_imagePath}heart_white.png';
  final String icSter = '${_imagePath}star.png';
  final String icCross = '${_imagePath}cross.png';
  final String icCar = '${_imagePath}car.png';
  final String icJoin = '${_imagePath}join.png';
  final String icEdit = '${_imagePath}edit.png';
  final String icSettings = '${_imagePath}settings.png';
  final String icHelp = '${_imagePath}help.png';
  final String icSecurity = '${_imagePath}security.png';
  final String imgNoNotification = '${_imagePath}no_notification.png';
  final String icPrivacy = '${_imagePath}privacy.png';
  final String icSos = '${_imagePath}sos.png';
  final String icDark = '${_imagePath}dark.png';
  final String icSocial = '${_imagePath}social.png';
  final String icAbout = '${_imagePath}about.png';
  final String icLigout = '${_imagePath}logout.png';
  final String imgTransport = '${_imagePath}transport.png';
  final String imgDriver = '${_imagePath}driver.png';
  final String imgCars = '${_imagePath}cars.png';
  final String imgBike = '${_imagePath}bike.png';
  final String imgCycle = '${_imagePath}cycle.png';
  final String imgTaxi = '${_imagePath}taxi.png';
  final String imgSeat = '${_imagePath}seat.png';
  final String imgDoor = '${_imagePath}door.png';
  final String imgManual = '${_imagePath}manual.png';
  final String imgAc = '${_imagePath}ac.png';
}

@riverpod
AppAssetConstants appAssetConstants(AppAssetConstantsRef ref) {
  return AppAssetConstants();
}
