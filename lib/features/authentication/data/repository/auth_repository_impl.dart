import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_dating_app/features/authentication/data/data_source/auth_firebase_data_source.dart';
import 'package:travel_dating_app/features/authentication/data/data_source/auth_firebase_data_source_impl.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  ///data source
  final AuthFirebaseDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  ///signup using email
  @override
  Future<UserCredential> signUp(String email, String password) async {
    return await dataSource.signUp(email, password);
  }

  ///signin using email
  @override
  Future<UserCredential> signIn(String email, String password) async {
    return await dataSource.signIn(email, password);
  }

  ////verification email
  @override
  Future<void> emailVerification() async {
    await dataSource.emailVerification();
  }

  ////signin using phone number
  Future<(String, int?)> loginWithPhone(String phone) async {
    return await dataSource.loginWithPhone(phone);
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    await dataSource.verifyOtp(verificationId, otp);
  }

  ///google signin
  @override
  Future<void> googleSignIn() async {
    await dataSource.googleSignIn();
  }

  ///forgot password
  @override
  Future<void> resetPassword(String email) async {
    await dataSource.resetPassword(email);
  }

////signout
  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    dataSource: ref.watch(
      authFirebaseDataSourceProvider,
    ),
  );
}
