import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/transport_select_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/features/create/presentation/pages/vehicle_overview_page.dart';

class CarsGridViewWidget extends ConsumerWidget {
  const CarsGridViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(transportSelectPageConstantsProvider);

    return GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: spaces.space_500 * 6.3,
        mainAxisSpacing: spaces.space_200,
        crossAxisSpacing: spaces.space_200,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: colors.textSubtle,
            borderRadius: BorderRadius.circular(
              spaces.space_100,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(spaces.space_100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: spaces.space_500 * 4,
                      height: spaces.space_500 * 3,
                      decoration: BoxDecoration(
                        color: colors.secondary,
                        borderRadius: BorderRadius.circular(
                          spaces.space_200,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.all(spaces.space_50),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors.textInverse,
                            borderRadius: BorderRadius.circular(
                              spaces.space_200,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(spaces.space_100),
                            child: const Text('800 m away'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox8Widget(),
                Text(
                  "Name",
                  style: typography.h800,
                ),
                Text(
                  "5 seats | Octane",
                  style: typography.h500,
                ),
                const SizedBox8Widget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStatePropertyAll(colors.primary),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(spaces.space_100),
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.push(VehicleOverviewPage.routePath);
                      },
                      child: Text(
                        constants.txtViewDetails,
                        style: typography.uiSemibold
                            .copyWith(color: colors.secondary),
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
