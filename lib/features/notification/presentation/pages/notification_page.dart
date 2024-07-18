import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/notification_constants/notification_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';
import 'package:travel_dating_app/features/notification/presentation/widgets/notification_tab_widget.dart';

class NotificationPage extends HookConsumerWidget {
  static const routePath = '/notification';
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///constants
    final constants = ref.watch(notificationPageConstantsProvider);
    final asset = ref.watch(appAssetConstantsProvider);

    ///tab to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtAll,
          },
          {
            'text': constants.txtInvites,
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
                const Row(
                  children: [
                    BackArrowButton(),
                  ],
                ),
                const SizedBox16Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: PageTitleWidget(
                    title: constants.txtNotifications,
                  ),
                ),
                const SizedBox16Widget(),
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
                              child: NotificationTabWidget(
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
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(asset.imgNoNotification),
                      HeaddingTextWidget(text: constants.txtNoNotification),
                      SubHeaddingTextWidget(text: constants.txtSub)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
