import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/constants/authenication_constants/sign_up_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/textfield_widget.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/signin_with_number_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:travel_dating_app/features/authentication/presentation/widgets/image_button.dart';

class SignUpPage extends HookConsumerWidget {
  static const routePath = '/signUp';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///constants
    final constants = ref.watch(signUpPageConstantsProvider);
    final asset = ref.watch(appAssetConstantsProvider);
    final appConstants = ref.watch(appConstantsProvider);

    //theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///controller
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

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
                  TextfieldWidget(
                    hintText: constants.txtEmail,
                    prefixIcon: const Icon(Icons.email),
                    controller: emailController,
                  ),
                  const SizedBox24Widget(),
                  TextfieldWidget(
                    hintText: constants.txtPasword,
                    prefixIcon: const Icon(Icons.lock),
                    controller: passwordController,
                  ),
                  const SizedBox24Widget(),
                  // TextfieldWidget(
                  //   hintText: constants.txtConfirmPass,
                  //   prefixIcon: const Icon(Icons.lock),
                  //   controller: confirmPasswordColtroller,
                  // ),
                  const SizedBox24Widget(),
                  ElevatedButtonWidget(
                    text: appConstants.txtContinue,
                    onPressed: () {
                      ref.read(authenticationProvider.notifier).signup(context,
                          emailController.text, passwordController.text);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(constants.txtVerify),
                            content: Text(constants.txtPleasGo),
                          );
                        },
                      );
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
                        constants.txtOrSignUpwith,
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
                  const SizedBox32Widget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                    child: Row(
                      children: [
                        Expanded(
                          child: ImageButton(
                            assetText: asset.icPhone,
                            buttonText: constants.txtPhone,
                            onTap: () {
                              context.push(SignInWithNumberPage.routePath);
                            },
                          ),
                        ),
                        SizedBox(
                          width: spaces.space_200,
                        ),
                        Expanded(
                          child: ImageButton(
                            assetText: asset.icGoogle,
                            buttonText: constants.txtGoogle,
                            onTap: () {
                              ref
                                  .read(authenticationProvider.notifier)
                                  .googleSignin(
                                    context,
                                  );
                            },
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
                        constants.txtAlreadyAccount,
                        style: typography.h500,
                      ),
                      SizedBox(
                        width: spaces.space_25,
                      ),
                      InkWell(
                        onTap: () => context.push(SignInPage.routePath),
                        child: Text(
                          constants.txtSignIn,
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
