import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/home_constants/home_page_constatns.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/features/home_page/presentation/widgets/button_widget.dart';

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
                    horizontal: spaces.space_300,
                    vertical: spaces.space_400,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(assetName: asset.icMale),
                      Text(
                        constants.txtTitle,
                        style: typography.h700,
                      ),
                      ButtonWidget(assetName: asset.icNotification),
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
