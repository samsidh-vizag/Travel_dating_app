import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/matches_constants/matches_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/features/matches/presentation/widgets/tab_bar_widget.dart';

class TabBarListviewWidget extends HookConsumerWidget {
  const TabBarListviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(matchesPageConstantsProvider);

    /// Theme data
    final spaces = AppTheme.of(context).spaces;

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

    return SizedBox(
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
              isSelected: selectedTabType.value == tabsToShow[i]['type'],
            )
        ],
      ),
    );
  }
}
