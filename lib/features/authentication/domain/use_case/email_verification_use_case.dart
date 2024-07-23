import 'package:travel_dating_app/core/exception/authentication/auth_field_exception.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';

final class EmailVerificationUseCase {
  final AuthRepository repository;
  EmailVerificationUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.emailVerification();
    } on Exception {
      throw AuthenticationFailedException(
        "Email Verification failed please retry",
      );
    }
  }
}
