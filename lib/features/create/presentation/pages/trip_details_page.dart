import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/trip_detail_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/tab_bar_widgets.dart';

class TripDetailsPage extends HookConsumerWidget {
  static const routePath = '/tripDetails';
  const TripDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final boxShadow = AppTheme.of(context).boxShadow;

    ///constants
    final constants = ref.watch(tripDetailPageConstantsProvider);
    final asset = ref.watch(appAssetConstantsProvider);

    ///tab to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtPublic,
          },
          {
            'text': constants.txtPrivate,
          },
        ]);

    /// Selected tab
    final selectedTabType = useState<String?>(tabsToShow[0]['text']);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedTabType.value = tabsToShow[index]['text'];
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: spaces.space_500 * 7,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 250,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.secondary,
                        boxShadow: [boxShadow.primary],
                        borderRadius: BorderRadius.circular(
                          spaces.space_500,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: spaces.space_200,
                            vertical: spaces.space_100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(),
                                CircleAvatar(),
                                CircleAvatar(),
                                Text("+2 Invited"),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: const WidgetStatePropertyAll(0),
                                    backgroundColor:
                                        WidgetStatePropertyAll(colors.primary),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            spaces.space_100),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    constants.txtInvite,
                                    style: typography.uiSemibold
                                        .copyWith(color: colors.secondary),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: spaces.space_300,
                          top: spaces.space_400,
                          right: spaces.space_300,
                        ),
                        child: Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Ink(
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.circular(spaces.space_100),
                                    onTap: () => context.pop(),
                                    child: Container(
                                      width: spaces.space_500,
                                      height: spaces.space_500,
                                      decoration: BoxDecoration(
                                        color: colors.secondary.withOpacity(.2),
                                        boxShadow: [
                                          boxShadow.primary,
                                        ],
                                        borderRadius: BorderRadius.circular(
                                            spaces.space_100),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          asset.icArrowBackward,
                                          height: spaces.space_200,
                                          colorFilter: ColorFilter.mode(
                                              colors.secondary,
                                              BlendMode.srcATop),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: spaces.space_300,
                                ),
                                Text(
                                  constants.txtEventDetails,
                                  style: typography.h600.copyWith(
                                    color: colors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(spaces.space_200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trip to Goa',
                      style: typography.h1000,
                    ),
                    Column(
                      children: [
                        Text(
                          '323 €',
                          style:
                              typography.h1000.copyWith(color: colors.primary),
                        ),
                        Text(
                          constants.txtBudget,
                          style: typography.h500,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                child: Container(
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: BoxDecoration(
                    color: colors.textSubtlest,
                    borderRadius: BorderRadius.circular(
                      spaces.space_100,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(spaces.space_50),
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
                padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: spaces.space_125 * 5,
                      height: spaces.space_125 * 5,
                      decoration: BoxDecoration(
                        color: colors.textSubtle,
                        borderRadius: BorderRadius.circular(
                          spaces.space_100,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '22 Oct,2024 - 31 Oct,2024',
                          style: typography.h600,
                        ),
                        Text(
                          'Tue, 4:00PM - Wed, 9:00PM',
                          style: typography.h400.copyWith(
                            color: colors.textInverse,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_right_sharp,
                        size: spaces.space_400,
                        color: colors.primary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox8Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: spaces.space_125 * 5,
                      height: spaces.space_125 * 5,
                      decoration: BoxDecoration(
                        color: colors.textSubtle,
                        borderRadius: BorderRadius.circular(
                          spaces.space_100,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          constants.txtViewTrip,
                          style: typography.h600,
                        ),
                        Text(
                          'Delhi - Goa',
                          style: typography.h400.copyWith(
                            color: colors.textInverse,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_right_sharp,
                        size: spaces.space_400,
                        color: colors.primary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox32Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: spaces.space_125 * 5,
                      height: spaces.space_125 * 5,
                      decoration: BoxDecoration(
                        color: colors.textSubtle,
                        borderRadius: BorderRadius.circular(
                          spaces.space_100,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ashfak Sayem",
                          style: typography.h600,
                        ),
                        Text(
                          constants.txtOrganizer,
                          style: typography.h400.copyWith(
                            color: colors.textInverse,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor:
                            WidgetStatePropertyAll(colors.textSubtlest),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(spaces.space_100),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        constants.txtShare,
                        style: typography.uiSemibold
                            .copyWith(color: colors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox32Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                child: Text(
                  "About Event",
                  style: typography.h700,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButtonWidget(
        text: constants.txtConfirmAnd,
        onPressed: () {
          context.push(BottomNaviWidget.routePath);
        },
      ),
    );
  }
}
