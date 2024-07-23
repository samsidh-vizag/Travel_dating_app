import 'package:travel_dating_app/core/exception/authentication/auth_field_exception.dart';
import 'package:travel_dating_app/core/exception/authentication/invalid_credentials_exception.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';

final class SignupUsecase {
  final AuthRepository repository;
  SignupUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    /// Verify email and password
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }

    try {
      await repository.signUp(email, password);
    } on Exception {
      throw AuthenticationFailedException('Cannot signup. Please try again.');
    }
  }
}
