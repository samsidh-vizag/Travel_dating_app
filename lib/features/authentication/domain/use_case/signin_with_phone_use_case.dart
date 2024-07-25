import 'package:travel_dating_app/core/exception/authentication/invalid_credentials_exception.dart';
import 'package:travel_dating_app/core/exception/base_exception.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';

final class LogInWithPhoneUseCase {
  final AuthRepository repository;
  LogInWithPhoneUseCase({required this.repository});

  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return await repository.loginWithPhone(phone);
    } on Exception {
      throw BaseException('Enter Phone number correctly');
    }
  }
}
