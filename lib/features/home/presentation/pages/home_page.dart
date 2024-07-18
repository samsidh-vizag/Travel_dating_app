import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/home_constants/home_page_constatns.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/button_widget.dart';
import 'package:travel_dating_app/features/home/presentation/widgets/carousel_slider_widget.dart';
import 'package:travel_dating_app/features/home/presentation/widgets/near_tours_gridview_widget.dart';
import 'package:travel_dating_app/features/home/presentation/widgets/nearest_travelers_listview_widget.dart';
import 'package:travel_dating_app/features/home/presentation/widgets/upcoming_tours_listview_widget.dart';
import 'package:travel_dating_app/features/home/presentation/widgets/search_text_fieald_widget.dart';
import 'package:travel_dating_app/features/home/presentation/widgets/story_view_listview_widget.dart';
import 'package:travel_dating_app/features/home/presentation/widgets/title_widget.dart';
import 'package:travel_dating_app/features/notification/presentation/pages/notification_page.dart';
import 'package:travel_dating_app/features/profile/presentation/pages/profile_page.dart';

class HomePage extends HookConsumerWidget {
  static const routePath = '/homepage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///constatns
    final constants = ref.watch(homePageConstatnsProvider);
    final asset = ref.watch(appAssetConstantsProvider);

    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///controller
    final searchController = useTextEditingController();

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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space_200,
                    vertical: spaces.space_400,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        assetName: asset.icMale,
                        onTap: () {
                          context.push(ProfilePage.routePath);
                        },
                      ),
                      Text(
                        constants.txtTitle,
                        style: typography.h700,
                      ),
                      ButtonWidget(
                        assetName: asset.icNotification,
                        onTap: () {
                          context.push(
                            NotificationPage.routePath,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SearchTextfieldWidget(
                          hintText: constants.txtSearch,
                          prefixIcon: Icon(
                            Icons.search,
                            color: colors.primary,
                          ),
                          controller: searchController),
                      ButtonWidget(
                        assetName: asset.icFilter,
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.only(left: spaces.space_100),
                  child: SizedBox(
                    height: spaces.space_100 * 12,
                    child: const StoryViewListviewWidget(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                  child: const CarouselSliderWidget(),
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                  child: TitleWidget(
                    title: constants.txtUpcomingTour,
                  ),
                ),
                const SizedBox16Widget(),
                Padding(
                  padding: EdgeInsets.only(left: spaces.space_100),
                  child: SizedBox(
                    height: spaces.space_150 * 16,
                    child: const UpcomingToursListviewWidget(),
                  ),
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                  child: TitleWidget(
                    title: constants.txtNearBy,
                  ),
                ),
                const SizedBox16Widget(),
                SizedBox(
                  height: spaces.space_500 * 10.5,
                  child: const NearToursGridviewWidget(),
                ),
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
                  child: TitleWidget(
                    title: constants.txtTraveler,
                  ),
                ),
                const SizedBox16Widget(),
                Padding(
                  padding: EdgeInsets.all(spaces.space_200),
                  child: SizedBox(
                    height: spaces.space_500 * 11,
                    child: const NearestTravelersListviewWidget(),
                  ),
                ),
                Container(
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
