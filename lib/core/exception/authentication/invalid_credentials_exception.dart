import 'package:travel_dating_app/core/exception/base_exception.dart';

final class InvalidCredentialsException extends BaseException {
  InvalidCredentialsException() : super('Invalid user input');
}
