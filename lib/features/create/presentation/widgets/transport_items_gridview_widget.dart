import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/transport_select_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/features/create/presentation/pages/transport_page.dart';

class TransportItemsGridviewWidget extends HookConsumerWidget {
  const TransportItemsGridviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///constants
    final constants = ref.watch(transportSelectPageConstantsProvider);
    final asset = ref.watch(appAssetConstantsProvider);

    ///tab to show
    final tabsToShow = useMemoized(() => [
          {
            'text': constants.txtCar,
            'type': asset.imgCars,
          },
          {
            'text': constants.txtBike,
            'type': asset.imgBike,
          },
          {
            'text': constants.txtCycle,
            'type': asset.imgCycle,
          },
          {
            'text': constants.txtTaxi,
            'type': asset.imgTaxi,
          },
        ]);

    /// Selected tab
    final selectedTabType = useState<String?>(null);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedTabType.value = tabsToShow[index]['text'];
      context.push(TransportPage.routePath);
    }

    return GridView.builder(
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: spaces.space_200,
          crossAxisSpacing: spaces.space_200,
          mainAxisExtent: spaces.space_500 * 4),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: InkWell(
            onTap: () => tabOnPressed(index),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: spaces.space_125 * 14,
                      height: spaces.space_125 * 14,
                      decoration: BoxDecoration(
                        color: colors.secondary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colors.primary,
                        ),
                      ),
                      child: Image.asset(tabsToShow[index]['type'] as String),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: spaces.space_400,
                        width: spaces.space_125 * 14,
                        decoration: BoxDecoration(
                          color: colors.secondary,
                          borderRadius: BorderRadius.circular(spaces.space_400),
                          border: Border.all(
                            color: colors.primary,
                          ),
                        ),
                        child: Center(
                            child: Text(tabsToShow[index]['text'] as String)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
