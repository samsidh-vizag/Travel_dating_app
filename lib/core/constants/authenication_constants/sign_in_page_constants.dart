import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_page_constants.g.dart';

class SignInPageConstants {
  final String txtHeading = 'Welcome Back';
  final String txtEmail = 'Enter Your Email';
  final String txtPasword = "Enter Password";
  final String txtOrSignInwith = 'Or Sign In With';
  final String txtFacebook = 'Facebook';
  final String txtGoogle = 'Google';
  final String txtDontAccount = '''Dont't have an account''';
  final String txtSignUp = 'Sign Up';
  final String txtForgotPass = 'Forgot Password';
  final String txtGoYour = 'Email';
  final String txtPlease = 'Please check your email,and change password';
}

@riverpod
SignInPageConstants signInPageConstants(SignInPageConstantsRef ref) {
  return SignInPageConstants();
}
