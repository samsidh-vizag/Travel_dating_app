import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_page_constants.g.dart';

class SettingsPageConstants {
  final String txtSettings = 'Settings';
  final String txtPrivacy = 'Privacy';
  final String txtNotification = 'Notification';
  final String txtAddSocial = 'Add Social Accounts';
  final String txtEmergency = 'Emergency SOS';
  final String txtAbout = 'About';
  final String txtDarkMode = 'Dark Mode';
  final String txtLogOut = 'Logout';
}

@riverpod
SettingsPageConstants settingsPageConstants(SettingsPageConstantsRef ref) {
  return SettingsPageConstants();
}
