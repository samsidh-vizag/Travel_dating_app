import 'package:travel_dating_app/core/exception/base_exception.dart';

final class AuthenticationFailedException extends BaseException {
  AuthenticationFailedException(super.reason);
}
