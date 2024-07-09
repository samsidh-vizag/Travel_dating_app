import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/account_creation_contants/create_account_page_constants.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';
import 'package:travel_dating_app/core/widgets/textfiels_and_title_widget.dart';
import 'package:travel_dating_app/features/authentication/presentation/widgets/progressbar_container.dart';

class CreateAccountPage extends HookConsumerWidget {
  static const routePath = '/createAccount';
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(createAccountPageConstantsProvider);
    final appConstants = ref.watch(appConstantsProvider);
    final assets = ref.watch(appAssetConstantsProvider);
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();

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
                HeaddingTextWidget(text: constants.txtHeading),
                SubHeaddingTextWidget(text: constants.txtSubHeading),
                const SizedBox16Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space_400 * 3,
                  ),
                  child: ProgressbarContainer(
                    stepOne: colors.primary,
                    stepTwo: colors.primary,
                    stepThree: colors.textSubtlest,
                    stepFour: colors.textSubtlest,
                    stepFive: colors.textSubtlest,
                  ),
                ),
                const SizedBox24Widget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 70,
                      child: Column(
                        children: [
                          Image.asset(
                            assets.icMale,
                          ),
                          Text(
                            constants.txtMale,
                            style: typography.h600,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 70,
                      child: Column(
                        children: [
                          Image.asset(
                            assets.icFemale,
                          ),
                          Text(
                            constants.txtFemale,
                            style: typography.h600,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space_300,
                  ),
                  child: Divider(
                    color: colors.primary,
                  ),
                ),
                TextFieldAndTitleWidget(
                  enabled: true,
                  textFieldTitle: constants.txtName,
                  hintText: constants.txtEnterName,
                  controller: nameController,
                ),
                TextFieldAndTitleWidget(
                  enabled: true,
                  textFieldTitle: constants.txtEmail,
                  hintText: constants.txtEnterEmail,
                  controller: emailController,
                ),
                TextFieldAndTitleWidget(
                  enabled: true,
                  textFieldTitle: constants.txtDateOfBirth,
                  hintText: constants.txtDate,
                  controller: nameController,
                ),
                SizedBox(
                  height: spaces.space_500,
                ),
                ElevatedButtonWidget(
                  text: appConstants.txtContinue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
