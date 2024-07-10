import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_constants.g.dart';

class AppConstants {
  final String txtContinue = 'Continue';
  final String txtHome = 'Home';
  final String txtChat = 'Chat';
  final String txtMatches = 'Matches';
  final String txtProfile = 'Profile';
  final String txtCamera = 'Camara';
  final String txtGallery = 'Gallery';
  final String txtDelete = 'Delete';
}

@riverpod
AppConstants appConstants(AppConstantsRef ref) {
  return AppConstants();
}
