import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/create_schedule_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/button_eleveted_widget.dart';
import 'package:travel_dating_app/features/create/presentation/pages/create_event_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/select_driver_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/select_transport_page.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/add_on_container_widget.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/map_text_field_widget.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/tab_bar_widgets.dart';

class CreateSchedulePage extends HookConsumerWidget {
  static const routePath = '/schedule';
  const CreateSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(createSchedulePageConstantsProvider);
    final appAsset = ref.watch(appAssetConstantsProvider);

    ///controller
    final fromController = useTextEditingController();
    final toController = useTextEditingController();
    final popupController = useTextEditingController();

    ///tab to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtTime,
          },
          {
            'text': constants.txtBudget,
          },
          {
            'text': constants.txtActivities,
          },
        ]);

    /// Selected tab
    final selectedTabType = useState<String?>(tabsToShow[0]['text']);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedTabType.value = tabsToShow[index]['text'];
    }

    return Scaffold(
      body: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const BackArrowButton(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: spaces.space_400,
                        right: spaces.space_300,
                      ),
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
                          context.push(CreateEventPage.routePath);
                        },
                        child: Text(
                          constants.txtDone,
                          style: typography.uiSemibold
                              .copyWith(color: colors.secondary),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: SizedBox(
                    height: spaces.space_150 * 5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: spaces.space_400,
                          ),
                          child: InkWell(
                            child: Column(
                              children: [
                                Text(
                                  '${constants.txtDay} ${index + 1}',
                                  style: typography.h500,
                                ),
                                SizedBox(
                                  height: spaces.space_50,
                                ),
                                Container(
                                  width: spaces.space_100 * 8,
                                  height: 2,
                                  color: colors.primary,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: Row(
                    children: [
                      Text(
                        '12/12/2024',
                        style: typography.h700,
                      ),
                    ],
                  ),
                ),
                const SizedBox16Widget(),
                MapTextFieldWidget(
                  hintText: constants.txtFrom,
                  controller: fromController,
                ),
                const SizedBox8Widget(),
                MapTextFieldWidget(
                  hintText: constants.txtTo,
                  controller: toController,
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colors.textSubtlest,
                      borderRadius: BorderRadius.circular(
                        spaces.space_100,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          for (var i = 0; i < tabsToShow.length; i++)
                            Expanded(
                              child: TabBarWidgets(
                                text: tabsToShow[i]['text'] as String,
                                isSelected: selectedTabType.value ==
                                    tabsToShow[i]['text'],
                                onPressed: () => tabOnPressed(i),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space_300,
                  ),
                  child: Container(
                    height: spaces.space_500 * 4,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: colors.textSubtlest,
                      borderRadius: BorderRadius.circular(
                        spaces.space_125,
                      ),
                    ),
                  ),
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddOnContainerWidget(
                        image: appAsset.imgTransport,
                        text: constants.txtAddTransport,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(constants.txtHoeMany),
                                actions: [
                                  MapTextFieldWidget(
                                      hintText: '',
                                      controller: popupController),
                                  TextButton(
                                    child: Text(constants.txtOk),
                                    onPressed: () {
                                      context
                                          .push(SelectTransportPage.routePath);
                                      context.pop();
                                      popupController.clear();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      AddOnContainerWidget(
                        image: appAsset.imgDriver,
                        text: constants.txtAddDriver,
                        onTap: () {
                          context.push(SelectDriverPage.routePath);
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox32Widget(),
                ButtonElevatedWidget(
                  text: constants.txtAddAnother,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
