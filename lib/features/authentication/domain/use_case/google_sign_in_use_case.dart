import 'package:travel_dating_app/core/exception/authentication/auth_field_exception.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';

final class GoogleSignInUseCase {
  final AuthRepository repository;
  GoogleSignInUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.googleSignIn();
    } on Exception {
      throw AuthenticationFailedException(
        "Google SignIn failed please retry",
      );
    }
  }
}
