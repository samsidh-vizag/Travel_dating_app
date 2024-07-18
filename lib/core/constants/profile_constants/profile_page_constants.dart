import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_page_constants.g.dart';

class ProfilePageConstants {
  final String txtProfile = 'Profile';
  final String txtEdit = 'Edit Profile';
  final String txtSecurity = 'Security';
  final String txtSettings = 'Settings';
  final String txtHelp = 'Help & Support';
  final String txtComplete = 'Comleted';
  final String txtAddImage = 'Add Image';
}

@riverpod
ProfilePageConstants profilePageConstants(ProfilePageConstantsRef ref) {
  return ProfilePageConstants();
}
