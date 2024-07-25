import 'package:travel_dating_app/core/exception/authentication/auth_field_exception.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';

final class ResetPasswordUseCase {
  final AuthRepository repository;
  ResetPasswordUseCase({required this.repository});
  Future<void> call(String email) async {
    try {
      await repository.resetPassword(email);
    } on Exception {
      throw AuthenticationFailedException(
        "Failed please retry",
      );
    }
  }
}
