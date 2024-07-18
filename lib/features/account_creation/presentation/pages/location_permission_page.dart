import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/account_creation_contants/location_permission_page_constatns.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';

class LocationPermissionPage extends ConsumerWidget {
  static const routePath = '/locationPermission';
  const LocationPermissionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///constants
    final constants = ref.watch(locationPermissionPageConstatnsProvider);
    final assets = ref.watch(appAssetConstantsProvider);

    ///theme
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assets.imgLocation),
            HeaddingTextWidget(text: constants.txtHeading),
            SubHeaddingTextWidget(text: constants.txtSubHeading),
            const SizedBox8Widget(),
            ElevatedButtonWidget(
              color: colors.primary,
              text: constants.txtAllow,
              onPressed: () {
                context.push(BottomNaviWidget.routePath);
              },
            ),
            Text(
              constants.txtManually,
              style: typography.h600.copyWith(
                color: colors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
