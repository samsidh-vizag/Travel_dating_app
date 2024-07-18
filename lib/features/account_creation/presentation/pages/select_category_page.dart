import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/account_creation_contants/category_page_constants.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/progressbar_container.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/select_interest_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/widget/tab_widget.dart';

class CategoryPage extends HookConsumerWidget {
  static const routePath = '/category';
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///constants
    final constants = ref.watch(categoryPageConstantsProvider);
    final appConstants = ref.watch(appConstantsProvider);

    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///tab to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtRelationship,
            'type': constants.txtRelationship,
          },
          {
            'text': constants.txtSomething,
            'type': constants.txtSomething,
          },
          {
            'text': constants.txtNotsure,
            'type': constants.txtNotsure,
          },
          {
            'text': constants.txtPrefer,
            'type': constants.txtPrefer,
          },
        ]);

    /// Selected tab
    final selectedTabType = useState<String?>(null);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedTabType.value = tabsToShow[index]['type'];
    }

    return Scaffold(
      body: Container(
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
                  stepThree: colors.primary,
                  stepFour: colors.textSubtlest,
                  stepFive: colors.textSubtlest,
                ),
              ),
              const SizedBox24Widget(),
              for (var i = 0; i < tabsToShow.length; i++)
                TabWidget(
                  text: tabsToShow[i]['text'] as String,
                  isSelected: selectedTabType.value == tabsToShow[i]['type'],
                  onPressed: () => tabOnPressed(i),
                ),
              SizedBox(
                height: spaces.space_500,
              ),
              ElevatedButtonWidget(
                color: colors.primary,
                text: appConstants.txtContinue,
                onPressed: () {
                  context.push(SelectInterestPage.routePath);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
