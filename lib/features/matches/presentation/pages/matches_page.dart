import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/features/matches/presentation/widgets/user_profile_lgridview_widget.dart';

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
                  SizedBox16Widget(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: UserProfileGridviewWidget(),
                  ),
                  SizedBox(
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
