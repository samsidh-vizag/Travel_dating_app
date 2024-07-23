import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/driver_overview_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/features/create/presentation/pages/create_schedule_page.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/driver_page_tab_bar_widget.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/places_grid_view_widget.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/row_widget.dart';

class DriverOverviewPage extends HookConsumerWidget {
  static const routePath = '/driverOverview';
  const DriverOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(driverOverviewPageConstantsProvider);

    ///tab to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtDetails,
          },
          {
            'text': constants.txtReview,
          },
        ]);

    /// Selected tab
    final selectedTabType = useState<String?>(tabsToShow[0]['text']);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedTabType.value = tabsToShow[index]['text'];
    }

    /// Widget for each tab change
    Widget getTabContent() {
      switch (selectedTabType.value) {
        case 'Details':
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
            child: Container(
              decoration: BoxDecoration(
                color: colors.textSubtlest,
                borderRadius: BorderRadius.circular(
                  spaces.space_150,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(spaces.space_200),
                child: Column(
                  children: [
                    RowWidget(text: constants.txtDrivingId, value: 'M1123A1'),
                    RowWidget(
                        text: constants.txtPhoneNumber, value: '1234567890'),
                    RowWidget(text: constants.txtEmail, value: 'abc@gmail.com'),
                    RowWidget(text: constants.txtAddress, value: 'Delhi'),
                  ],
                ),
              ),
            ),
          );
        case 'Review':
          return const Center(
            child: Text("Review"),
          ); // Rep;

        default:
          return const PlacesGridViewWidget();
      }
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
                  children: [BackArrowButton()],
                ),
                const SizedBox16Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space_300,
                  ),
                  child: PageTitleWidget(
                    title: constants.txtDriverDetails,
                  ),
                ),
                SizedBox24Widget(),
                CircleAvatar(
                  radius: spaces.space_900,
                ),
                SizedBox8Widget(),
                Text(
                  "Name",
                  style: typography.h700,
                ),
                Text(
                  "Age : 30",
                  style: typography.h600.copyWith(
                    color: colors.textInverse,
                  ),
                ),
                SizedBox16Widget(),
                Row(
                  children: [
                    for (var i = 0; i < tabsToShow.length; i++)
                      Expanded(
                        child: DriverPageTabBarWidget(
                          text: tabsToShow[i]['text'] as String,
                          isSelected:
                              selectedTabType.value == tabsToShow[i]['text'],
                          onPressed: () => tabOnPressed(i),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: Divider(),
                ),
                SizedBox16Widget(),
                getTabContent(),
                SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: const WidgetStatePropertyAll(0),
                            backgroundColor:
                                WidgetStatePropertyAll(colors.secondary),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                side: BorderSide(color: colors.primary),
                                borderRadius:
                                    BorderRadius.circular(spaces.space_100),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            constants.txtCancel,
                            style: typography.uiSemibold
                                .copyWith(color: colors.primary),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: spaces.space_200,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: const WidgetStatePropertyAll(0),
                            backgroundColor:
                                WidgetStatePropertyAll(colors.primary),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(spaces.space_100),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.push(CreateSchedulePage.routePath);
                          },
                          child: Text(
                            constants.txtSelect,
                            style: typography.uiSemibold
                                .copyWith(color: colors.secondary),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
