import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_account_page_constants.g.dart';

class CreateAccountPageConstants {
  final String txtHeading = 'Create Your Account';
  final String txtSubHeading =
      'Let’s get started by setting up your Account Details';
  final String txtMale = 'Male';
  final String txtFemale = 'Female';
  final String txtName = 'Name';
  final String txtEmail = 'Email';
  final String txtDateOfBirth = 'Date Of Birth';
  final String txtEnterName = 'Enter Your Name';
  final String txtEnterEmail = 'Enter Your Email';
  final String txtDate = 'DD-MM-YYYY';
}

@riverpod
CreateAccountPageConstants createAccountPageConstants(
    CreateAccountPageConstantsRef ref) {
  return CreateAccountPageConstants();
}
