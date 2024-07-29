import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/constants/authenication_constants/sign_in_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/textfield_widget.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/provider/auth_provider.dart';

class SignInPage extends HookConsumerWidget {
  static const routePath = '/signIn';
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///constants
    final constants = ref.watch(signInPageConstantsProvider);
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
                  ElevatedButtonWidget(
                    text: appConstants.txtContinue,
                    onPressed: () {
                      ref.read(authenticationProvider.notifier).signin(context,
                          emailController.text, passwordController.text);
                    },
                  ),
                  const SizedBox8Widget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          ref
                              .read(authenticationProvider.notifier)
                              .reasetPasword(context, emailController.text);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(constants.txtGoYour),
                                content: Text(constants.txtPlease),
                              );
                            },
                          );
                        },
                        child: Text(
                          constants.txtForgotPass,
                          style: typography.h600
                              .copyWith(color: colors.textInverse),
                        ),
                      )
                    ],
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
