import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
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
import 'package:travel_dating_app/features/authentication/presentation/widgets/otp_textfield_widget.dart';
import 'package:travel_dating_app/features/authentication/presentation/widgets/progressbar_container.dart';

class OtpVerificationPage extends HookConsumerWidget {
  static const routePath = '/otpVerifiaction';
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(otpVerificationPageConstantsProvider);
    final assets = ref.watch(appAssetConstantsProvider);
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final boxShadow = AppTheme.of(context).boxShadow;

    final firstOtp = useTextEditingController();
    final secondOtp = useTextEditingController();
    final thirdOtp = useTextEditingController();
    final forthOtp = useTextEditingController();

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
                  '+919001999991',
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
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpTextFieldWidget(
                        controller: firstOtp,
                      ),
                      OtpTextFieldWidget(
                        controller: secondOtp,
                      ),
                      OtpTextFieldWidget(
                        controller: thirdOtp,
                      ),
                      OtpTextFieldWidget(
                        controller: forthOtp,
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
                SizedBox16Widget(),
                ElevatedButtonWidget(
                  text: constants.txtVerify,
                  onPressed: () {
                    context.push(CreateAccountPage.routePath);
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
