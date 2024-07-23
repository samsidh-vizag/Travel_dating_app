import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  /// signup  using email
  Future<UserCredential> signUp(
    final String email,
    final String password,
  );

  /// email verification
  Future<void> emailVerification();

  /// signin using email
  Future<UserCredential> signIn(
    final String email,
    final String password,
  );

  /// signin using phone number
  Future<(String, int?)> phoneNumberSignIn(
    String number,
  );

  /// otp verification
  Future<void> verifyOtp(String verificationId, String otp);

//// google singin
  Future<void> googleSignIn();

  ///fogot password
  Future<void> resetPassword(
    String email,
  );

  ///signout
  Future<void> signOut();
}
