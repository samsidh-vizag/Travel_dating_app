import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/constants/matches_constants/matches_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/features/matches/presentation/widgets/tab_bar_widget.dart';
import 'package:travel_dating_app/features/matches/presentation/widgets/user_profile_gridview_widget.dart';

class MatchesPage extends HookConsumerWidget {
  static const routePath = '/matchesPage';
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///constans
    final appConstants = ref.watch(appConstantsProvider);
    final constants = ref.watch(matchesPageConstantsProvider);

    /// Tabs to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtAll,
            'type': constants.txtAll,
          },
          {
            'text': constants.txtNewest,
            'type': constants.txtNewest,
          },
          {
            'text': constants.txtOnline,
            'type': constants.txtOnline,
          },
          {
            'text': constants.txtNearest,
            'type': constants.txtNearest,
          }
        ]);

    /// Selected tab
    final selectedTabType = useState<String?>(tabsToShow[0]['text']);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedTabType.value = tabsToShow[index]['type'];
    }

    /// Widget for each tab change
    Widget getTabContent() {
      switch (selectedTabType.value) {
        case 'Newest':
          return const Center(
            child: Text("Newest"),
          );
        case 'Online':
          return const Center(
            child: Text("Online"),
          );
        case 'Nearest':
          return const Center(
            child: Text("Nearest"),
          );
        case 'All':
          return const UserProfileGridviewWidget();
        default:
          return const UserProfileGridviewWidget();
      }
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_200),
              child: Column(
                children: [
                  SizedBox(
                    height: spaces.space_500,
                  ),
                  PageTitleWidget(
                    title: appConstants.txtMatches,
                  ),
                  const SizedBox16Widget(),
                  SizedBox(
                    height: spaces.space_500,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0; i < tabsToShow.length; i++)
                          TabBarButtonWidget(
                            onPressed: () {
                              tabOnPressed(i);
                            },
                            text: tabsToShow[i]['text'] as String,
                            isSelected:
                                selectedTabType.value == tabsToShow[i]['type'],
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: getTabContent(),
                  ),
                  const SizedBox(
                    height: 500,
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
