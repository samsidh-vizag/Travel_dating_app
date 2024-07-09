import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_page_constants.g.dart';

class SignUpPageConstants {
  final String txtHeading = '''Let's Sign Up With Your Email''';
  final String txtEmail = 'Enter Your Email';
  final String txtPasword = "Enter Password";
  final String txtConfirmPass = 'Confirm Pasword';
  final String txtOrSignUpwith = 'Or Sign Up With';
  final String txtFacebook = 'Facebook';
  final String txtGoogle = 'Google';
  final String txtAlreadyAccount = 'Already Have an Account?';
  final String txtSignIn = 'Sign In';
}

@riverpod
SignUpPageConstants signUpPageConstants(SignUpPageConstantsRef ref) {
  return SignUpPageConstants();
}
