import 'package:travel_dating_app/core/exception/authentication/invalid_credentials_exception.dart';
import 'package:travel_dating_app/core/exception/base_exception.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';

final class VerifyOtpUsecase {
  final AuthRepository repository;
  VerifyOtpUsecase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.verifyOtp(verificationId, otp);
    } on Exception {
      throw BaseException('Enter your otp correctly,try again');
    }
  }
}
