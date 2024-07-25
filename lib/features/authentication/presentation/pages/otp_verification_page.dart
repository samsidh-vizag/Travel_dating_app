import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/authenication_constants/otp_verification_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/create_account_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:travel_dating_app/features/authentication/presentation/widgets/otp_textfield_widget.dart';
import 'package:travel_dating_app/core/widgets/progressbar_container.dart';

class OtpVerificationPage extends HookConsumerWidget {
  static const routePath = '/otpVerifiaction';
  final String phone;
  const OtpVerificationPage({super.key, required this.phone});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// constants
    final constants = ref.watch(otpVerificationPageConstantsProvider);

    /// theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    /// controllers and focus nodes
    final firstOtp = useTextEditingController();
    final secondOtp = useTextEditingController();
    final thirdOtp = useTextEditingController();
    final fourthOtp = useTextEditingController();
    final fifthOtp = useTextEditingController();
    final sixthOtp = useTextEditingController();

    final firstFocus = useFocusNode();
    final secondFocus = useFocusNode();
    final thirdFocus = useFocusNode();
    final fourthFocus = useFocusNode();
    final fifthFocus = useFocusNode();
    final sixthFocus = useFocusNode();

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFFFEF7F8), colors.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    BackArrowButton(),
                  ],
                ),
                HeaddingTextWidget(text: constants.txtVerificationCode),
                SubHeaddingTextWidget(text: constants.txtPleaseEnter),
                Text(
                  phone,
                  style: typography.h600,
                ),
                const SizedBox16Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space_400 * 3,
                  ),
                  child: ProgressbarContainer(
                    stepOne: colors.primary,
                    stepTwo: colors.textSubtlest,
                    stepThree: colors.textSubtlest,
                    stepFour: colors.textSubtlest,
                    stepFive: colors.textSubtlest,
                  ),
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpTextFieldWidget(
                        controller: firstOtp,
                        focusNode: firstFocus,
                        nextFocusNode: secondFocus,
                      ),
                      OtpTextFieldWidget(
                        controller: secondOtp,
                        focusNode: secondFocus,
                        nextFocusNode: thirdFocus,
                      ),
                      OtpTextFieldWidget(
                        controller: thirdOtp,
                        focusNode: thirdFocus,
                        nextFocusNode: fourthFocus,
                      ),
                      OtpTextFieldWidget(
                        controller: fourthOtp,
                        focusNode: fourthFocus,
                        nextFocusNode: fifthFocus,
                      ),
                      OtpTextFieldWidget(
                        controller: fifthOtp,
                        focusNode: fifthFocus,
                        nextFocusNode: sixthFocus,
                      ),
                      OtpTextFieldWidget(
                        controller: sixthOtp,
                        focusNode: sixthFocus,
                      ),
                    ],
                  ),
                ),
                const SizedBox32Widget(),
                Text(
                  constants.txtDontReceive,
                  style: typography.h500,
                ),
                Text(
                  constants.txtResendCode,
                  style: typography.h600.copyWith(color: colors.primary),
                ),
                const SizedBox16Widget(),
                ElevatedButtonWidget(
                  text: constants.txtVerify,
                  onPressed: () {
                    /// function to get concatenated OTP
                    String getOtp() {
                      return firstOtp.text +
                          secondOtp.text +
                          thirdOtp.text +
                          fourthOtp.text +
                          fifthOtp.text +
                          sixthOtp.text;
                    }

                    final otp = getOtp();
                    print(otp);
                    ref
                        .read(authenticationProvider(context).notifier)
                        .verifyOtp(otp);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
