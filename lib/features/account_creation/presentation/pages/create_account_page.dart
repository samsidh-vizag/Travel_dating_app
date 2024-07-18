import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/account_creation_contants/create_account_page_constants.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';
import 'package:travel_dating_app/core/widgets/textfiels_and_title_widget.dart';
import 'package:travel_dating_app/core/widgets/progressbar_container.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/select_category_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/widget/tub_button_widget.dart';

class CreateAccountPage extends HookConsumerWidget {
  static const routePath = '/createAccount';
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///constants
    final constants = ref.watch(createAccountPageConstantsProvider);
    final appConstants = ref.watch(appConstantsProvider);
    final assets = ref.watch(appAssetConstantsProvider);

    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///controller
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();

    ///tab to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtMale,
            'type': assets.icMale,
          },
          {
            'text': constants.txtFemale,
            'type': assets.icFemale,
          },
        ]);

    /// Selected tab
    final selectedTabType = useState<String?>(null);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedTabType.value = tabsToShow[index]['type'];
    }

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
                      for (var i = 0; i < tabsToShow.length; i++)
                        TabButtonWidget(
                          buttonText: tabsToShow[i]['text'] as String,
                          isSelected:
                              selectedTabType.value == tabsToShow[i]['type'],
                          onPressed: () => tabOnPressed(i),
                          imageText: tabsToShow[i]['type'] as String,
                        ),
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
                    color: colors.primary,
                    text: appConstants.txtContinue,
                    onPressed: () {
                      context.push(CategoryPage.routePath);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
