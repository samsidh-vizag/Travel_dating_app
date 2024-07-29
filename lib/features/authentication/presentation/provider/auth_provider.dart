import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_dating_app/core/exception/base_exception.dart';
import 'package:travel_dating_app/core/utils/auth_snackbar_utils.dart';
import 'package:travel_dating_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/create_account_page.dart';
import 'package:travel_dating_app/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:travel_dating_app/features/authentication/domain/use_case/email_verification_use_case.dart';
import 'package:travel_dating_app/features/authentication/domain/use_case/google_sign_in_use_case.dart';
import 'package:travel_dating_app/features/authentication/domain/use_case/otp_use_case.dart';
import 'package:travel_dating_app/features/authentication/domain/use_case/reset_password_use_case.dart';
import 'package:travel_dating_app/features/authentication/domain/use_case/signin_use_case.dart';
import 'package:travel_dating_app/features/authentication/domain/use_case/signin_with_phone_use_case.dart';
import 'package:travel_dating_app/features/authentication/domain/use_case/signup_use_case.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/provider/auth_state.dart';
import 'package:travel_dating_app/features/home/presentation/pages/home_page.dart';

part 'auth_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  AuthState build() {
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> emailVerification() async {
    try {
      await EmailVerificationUseCase(
          repository: ref.read(authRepositoryProvider))();
    } on BaseException catch (e) {}
  }

  Future<void> signup(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await SignupUsecase(repository: ref.read(authRepositoryProvider))(
          email, password);
      await emailVerification();
      Future.sync(
        () => context.go(
          SignInPage.routePath,
        ),
      );
    } on BaseException catch (e) {
      Future.sync(() => AuthSnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signin(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await SigninUseCase(repository: ref.read(authRepositoryProvider))(
          email, password);
      if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        await emailVerification();
        Future.sync(() => AuthSnackbarUtils.showMessage(
            context, 'Please verify your email before logging in.'));
      } else {
        Future.sync(() => context.go(CreateAccountPage.routePath));
      }
    } on BaseException catch (e) {
      Future.sync(() => AuthSnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithPhone(BuildContext context, String phone) async {
    try {
      final verificationData = await LogInWithPhoneUseCase(
          repository: ref.read(authRepositoryProvider))(phone);

      Future.sync(
        () => context.push(
          OtpVerificationPage.routePath,
          extra: (phone, verificationData.$1),
        ),
      );
    } on BaseException catch (e) {
      Future.sync(() => AuthSnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(
      BuildContext context, String verificationId, String otp) async {
    try {
      await VerifyOtpUsecase(repository: ref.read(authRepositoryProvider))(
          verificationId, otp);
      Future.sync(
        () => context.go(CreateAccountPage.routePath),
      );
    } on BaseException catch (e) {
      Future.sync(() => AuthSnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> reasetPasword(BuildContext context, String email) async {
    try {
      await ResetPasswordUseCase(repository: ref.read(authRepositoryProvider))(
          email);
      Future.sync(() => context.go(SignInPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => AuthSnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> googleSignin(BuildContext context) async {
    try {
      await GoogleSignInUseCase(repository: ref.read(authRepositoryProvider))();
      Future.sync(() => context.go(CreateAccountPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => AuthSnackbarUtils.showMessage(context, e.message));
    }
  }
}
