import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/constants/authenication_constants/signin_with_number_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/widgets/image_button.dart';

class SignInWithNumberPage extends HookConsumerWidget {
  static const routePath = '/';
  const SignInWithNumberPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(signinWithNumberPageConstantsProvider);
    final asset = ref.watch(appAssetConstantsProvider);
    final appConstants = ref.watch(appConstantsProvider);
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    final phoneNumberController = useTextEditingController();

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: spaces.space_500 * 2,
                  ),
                  HeaddingTextWidget(text: constants.txtHeading),
                  const SizedBox32Widget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: IntlPhoneField(
                      flagsButtonPadding: EdgeInsets.all(spaces.space_125),
                      dropdownIconPosition: IconPosition.trailing,
                      showCountryFlag: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Phone number',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(spaces.space_100),
                            borderSide: BorderSide(
                                color: colors.textSubtlest, width: 1)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(spaces.space_100),
                          borderSide:
                              BorderSide(color: colors.primary, width: 1),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        phoneNumberController.text = phone.completeNumber;
                      },
                    ),
                  ),

                  // TextfieldWidget(
                  //   hintText: constants.txtEnterPhone,
                  //   prefixIcon: const Icon(Icons.email),
                  //   controller: phoneNumberController,
                  // ),
                  const SizedBox24Widget(),
                  ElevatedButtonWidget(
                    text: appConstants.txtContinue,
                    onPressed: () {
                      context.push(OtpVerificationPage.routePath);
                    },
                  ),
                  const SizedBox8Widget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width:
                            MediaQuery.sizeOf(context).width / spaces.space_75,
                        color: colors.textInverse,
                      ),
                      SizedBox(
                        width: spaces.space_125,
                      ),
                      Text(
                        constants.txtOrLoginWith,
                        style: typography.h600,
                      ),
                      SizedBox(
                        width: spaces.space_125,
                      ),
                      Container(
                        height: 1,
                        width:
                            MediaQuery.sizeOf(context).width / spaces.space_75,
                        color: colors.textInverse,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(spaces.space_300),
                    child: Row(
                      children: [
                        Expanded(
                          child: ImageButton(
                            assetText: asset.icFacebook,
                            buttonText: constants.txtFacebook,
                          ),
                        ),
                        SizedBox(
                          width: spaces.space_200,
                        ),
                        Expanded(
                          child: ImageButton(
                            assetText: asset.icGoogle,
                            buttonText: constants.txtGoogle,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox32Widget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        constants.txtDontAccount,
                        style: typography.h500,
                      ),
                      SizedBox(
                        width: spaces.space_25,
                      ),
                      InkWell(
                        onTap: () => context.push(SignUpPage.routePath),
                        child: Text(
                          constants.txtSignUp,
                          style: typography.h600.copyWith(
                            color: colors.primary,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
