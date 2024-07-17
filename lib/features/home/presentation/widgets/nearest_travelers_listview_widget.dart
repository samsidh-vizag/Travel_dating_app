import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';

class NearestTravelersListviewWidget extends ConsumerWidget {
  const NearestTravelersListviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    /// constants
    final asset = ref.watch(appAssetConstantsProvider);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(
            spaces.space_100,
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width / 1.2,
                height: spaces.space_500 * 11,
                decoration: BoxDecoration(
                  color: colors.secondary,
                  boxShadow: [
                    BoxShadow(
                        color: colors.textSubtlest,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(4, 4))
                  ],
                  border: Border.all(
                    width: .3,
                    color: colors.primary,
                  ),
                  borderRadius: BorderRadius.circular(
                    spaces.space_300,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(spaces.space_150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: spaces.space_500 * 7.5,
                        decoration: BoxDecoration(
                          color: colors.textSubtle,
                          borderRadius: BorderRadius.circular(
                            spaces.space_200,
                          ),
                        ),
                      ),
                      const SizedBox16Widget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: colors.secondary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: colors.textSubtlest,
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(1, 4))
                              ],
                            ),
                            child: Image.asset(
                              asset.icCross,
                              color: colors.primary,
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: colors.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: colors.textSubtlest,
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(1, 4))
                              ],
                            ),
                            child: Image.asset(
                              asset.icHeartWhite,
                              color: colors.secondary,
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: colors.secondary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: colors.textSubtlest,
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(1, 4))
                              ],
                            ),
                            child: Image.asset(
                              asset.icSter,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
