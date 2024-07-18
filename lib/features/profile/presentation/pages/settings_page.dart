import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/profile_constants/settings_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/features/profile/presentation/widgets/settings_item_widget.dart';

class SettingsPage extends ConsumerWidget {
  static const routePath = '/settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(settingsPageConstantsProvider);
    final asset = ref.watch(appAssetConstantsProvider);

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
          child: Column(
            children: [
              Row(
                children: [BackArrowButton()],
              ),
              Padding(
                padding: EdgeInsets.all(spaces.space_300),
                child: PageTitleWidget(
                  title: constants.txtSettings,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colors.textSubtlest,
                    borderRadius: BorderRadius.circular(
                      spaces.space_150,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(spaces.space_300),
                    child: Column(
                      children: [
                        SettingsItemWidget(
                          image: asset.icPrivacy,
                          text: constants.txtPrivacy,
                        ),
                        SettingsItemWidget(
                          image: asset.icNotification,
                          text: constants.txtNotification,
                        ),
                        SettingsItemWidget(
                          image: asset.icSocial,
                          text: constants.txtAddSocial,
                        ),
                        SettingsItemWidget(
                          image: asset.icSos,
                          text: constants.txtEmergency,
                        ),
                        SettingsItemWidget(
                          image: asset.icAbout,
                          text: constants.txtAbout,
                        ),
                        SettingsItemWidget(
                          image: asset.icDark,
                          text: constants.txtDarkMode,
                        ),
                        SettingsItemWidget(
                          image: asset.icLigout,
                          text: constants.txtLogOut,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
