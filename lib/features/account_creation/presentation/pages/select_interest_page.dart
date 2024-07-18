import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/account_creation_contants/select_interest_page_constants.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/progressbar_container.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/uploaad_photo_page.dart';
import 'package:travel_dating_app/core/widgets/button_interested_item_widget.dart';

class SelectInterestPage extends HookConsumerWidget {
  static const routePath = '/interest';
  const SelectInterestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///constamts
    final constants = ref.watch(selectInterestPageConstantsProvider);
    final asset = ref.watch(appAssetConstantsProvider);
    final appConstants = ref.watch(appConstantsProvider);

    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///button to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtReading,
            'icon': asset.icReading,
          },
          {
            'text': constants.txtPhotography,
            'icon': asset.icPhotography,
          },
          {
            'text': constants.txtTravel,
            'icon': asset.icTravel,
          },
          {
            'text': constants.txtGaming,
            'icon': asset.icGaming,
          },
          {
            'text': constants.txtMusic,
            'icon': asset.icMusic,
          },
          {
            'text': constants.txtCooking,
            'icon': asset.icCooking,
          },
          {
            'text': constants.txtCharity,
            'icon': asset.icCharity,
          },
          {
            'text': constants.txtFashion,
            'icon': asset.icFashion,
          },
          {
            'text': constants.txtPainting,
            'icon': asset.icPainting,
          },
          {
            'text': constants.txtPolitics,
            'icon': asset.icPolitics,
          },
          {
            'text': constants.txtSports,
            'icon': asset.icSports,
          },
        ]);

    /// Selected buttons
    final selectedTabs = useState<Set<String>>({});

    /// Handle tapping on the button items
    void tabOnPressed(int index) {
      final selected = tabsToShow[index]['text'] as String;
      final newSelectedTabs = {...selectedTabs.value};

      if (newSelectedTabs.contains(selected)) {
        newSelectedTabs.remove(selected);
      } else if (newSelectedTabs.length < 5) {
        newSelectedTabs.add(selected);
      }

      selectedTabs.value = newSelectedTabs;
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
                  stepFour: colors.primary,
                  stepFive: colors.textSubtlest,
                ),
              ),
              const SizedBox24Widget(),
              SizedBox(
                height: spaces.space_500 * tabsToShow.length,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 50,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: tabsToShow.length,
                    itemBuilder: (context, index) {
                      final tab = tabsToShow[index];
                      return ButtonInterestedItemWidget(
                        isSelected: selectedTabs.value.contains(tab['text']),
                        buttonText: tab['text'] as String,
                        onPressed: () => tabOnPressed(index),
                        icon: tab['icon'] as String,
                      );
                    },
                  ),
                ),
              ),
              ElevatedButtonWidget(
                text: appConstants.txtContinue,
                onPressed: () {
                  context.push(UploaadePhotoPage.routePath);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
