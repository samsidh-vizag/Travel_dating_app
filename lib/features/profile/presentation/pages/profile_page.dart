import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/profile_constants/profile_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/features/profile/presentation/pages/edit_profil_page.dart';
import 'package:travel_dating_app/features/profile/presentation/pages/settings_page.dart';
import 'package:travel_dating_app/features/profile/presentation/widgets/circle_button_widget.dart';
import 'package:travel_dating_app/features/profile/presentation/widgets/profile_image_widget.dart';

class ProfilePage extends ConsumerWidget {
  static const routePath = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(profilePageConstantsProvider);
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [BackArrowButton()],
                ),
                const SizedBox16Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: PageTitleWidget(
                    title: constants.txtProfile,
                  ),
                ),
                const SizedBox32Widget(),
                const ProfileImageWidget(),
                const SizedBox24Widget(),
                Text(
                  "Rahul sharma",
                  style: typography.h800,
                ),
                Text(
                  "Traveler",
                  style: typography.h500.copyWith(color: colors.textInverse),
                ),
                const SizedBox32Widget(),
                CircleButton(
                  image: asset.icEdit,
                  text: constants.txtEdit,
                  onPressed: () {
                    context.push(EditProfilPage.routePath);
                  },
                ),
                const SizedBox32Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleButton(
                        image: asset.icSettings,
                        text: constants.txtSettings,
                        onPressed: () {
                          context.push(SettingsPage.routePath);
                        },
                      ),
                      CircleButton(
                        image: asset.icSecurity,
                        text: constants.txtSecurity,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                const SizedBox32Widget(),
                CircleButton(
                  image: asset.icHelp,
                  text: constants.txtHelp,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
