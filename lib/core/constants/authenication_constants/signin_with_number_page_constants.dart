import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_with_number_page_constants.g.dart';

class SigninWithNumberPageConstants {
  final String txtHeading = '''Let's Start With Your Number''';
  final String txtEnterPhone = 'Enter Your Number';
  final String txtFacebook = 'Facebook';
  final String txtGoogle = 'Google';
  final String txtEmail = 'Email         ';
  final String txtTWitter = 'Twitter';
  final String txtDontAccount = '''Dont't have an account''';
  final String txtSignUp = 'Sign Up';
  final String txtOrLoginWith = 'Or Login With';
}

@riverpod
SigninWithNumberPageConstants signinWithNumberPageConstants(
    SigninWithNumberPageConstantsRef ref) {
  return SigninWithNumberPageConstants();
}
