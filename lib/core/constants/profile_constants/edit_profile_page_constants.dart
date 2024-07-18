import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_page_constants.g.dart';

class EditProfilePageConstants {
  final String txtEditProfile = 'Edit Profile';
  final String txtName = 'Name';
  final String txtEnterName = 'Enter your Name';
  final String txtEmail = 'Email';
  final String txtEnterEmail = 'Enter your email';
  final String txtNumber = 'Phone Number';
  final String txtEnterNumber = 'Enter your phone number';
  final String txtJob = 'Job';
  final String txtEnterJob = 'Enter your job';
  final String txtDateofBirth = 'Date Of Birth';
  final String txtDate = 'DD-MM-YYYY';
  final String txtHeight = 'Height';
  final String txtWeight = 'Weight';
  final String txtUploadPhoto = 'Upload Photo';
  final String txtSave = 'Save';
  final String txtAddImage = 'Add Image';
}

@riverpod
EditProfilePageConstants editProfilePageConstants(
    EditProfilePageConstantsRef ref) {
  return EditProfilePageConstants();
}
