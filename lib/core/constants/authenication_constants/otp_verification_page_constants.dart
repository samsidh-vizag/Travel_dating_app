import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_verification_page_constants.g.dart';

class OtpVerificationPageConstants {
  final String txtVerificationCode = 'Verification Code';
  final String txtPleaseEnter = 'Please Enter code we just send to';
  final String txtVerify = 'Verify';
  final String txtDontReceive = '''Don't receive OTP?''';
  final String txtResendCode = 'Resend Code';
}

@riverpod
OtpVerificationPageConstants otpVerificationPageConstants(
    OtpVerificationPageConstantsRef ref) {
  return OtpVerificationPageConstants();
}
