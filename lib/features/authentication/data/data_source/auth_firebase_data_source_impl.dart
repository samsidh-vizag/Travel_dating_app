import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_dating_app/core/exception/authentication/auth_field_exception.dart';
import 'package:travel_dating_app/features/authentication/data/data_source/auth_firebase_data_source.dart';

part 'auth_firebase_data_source_impl.g.dart';

class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  final FirebaseAuth _auth;
  AuthFirebaseDataSourceImpl(this._auth);

  ///signup using email
  @override
  Future<UserCredential> signUp(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailedException(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailedException(
            'The account already exists for this email.');
      } else {
        throw AuthenticationFailedException('Cannot signup. Please try again');
      }
    }
  }

  ///signin using email
  @override
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('Wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthenticationFailedException('User is disabled. Cannot login');
      } else {
        throw AuthenticationFailedException('Cannot login. Please try again');
      }
    }
  }

  ////verification email
  @override
  Future<void> emailVerification() async {
    if (_auth.currentUser != null) {
      await _auth.currentUser!.sendEmailVerification();
    } else {
      throw AuthenticationFailedException('User is not Authenticate');
    }
  }

  ////signin using phone number
  @override
  Future<(String, int?)> phoneNumberSignIn(String number) {
    // TODO: implement phoneNumberSignIn
    throw UnimplementedError();
  }

////otp verification
  @override
  Future<void> verifyOtp(String verificationId, String otp) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  ///google signin
  @override
  Future<void> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  ///forgot password
  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

////signout
  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

@riverpod
AuthFirebaseDataSource authFirebaseDataSource(AuthFirebaseDataSourceRef ref) {
  return AuthFirebaseDataSourceImpl(FirebaseAuth.instance);
}
