import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/create_trip_constants_page.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';
import 'package:travel_dating_app/features/create/presentation/pages/interest_page.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/button_container_widget.dart';

class CreateTripPage extends ConsumerWidget {
  static const routePath = '/create';
  const CreateTripPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///constants
    final constants = ref.watch(createTripConstantsPageProvider);
    final asset = ref.watch(appAssetConstantsProvider);

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
          children: [
            SizedBox(
              height: spaces.space_500 * 2,
            ),
            HeaddingTextWidget(text: constants.txtHeading),
            SubHeaddingTextWidget(text: constants.txtSubHeading),
            SizedBox(
              height: spaces.space_100 * 8,
            ),
            ButtonContainerWidget(
              text: constants.txtCreateTrip,
              image: asset.icCar,
              onTap: () {
                context.push(InterestPage.routePath);
              },
            ),
            const SizedBox24Widget(),
            ButtonContainerWidget(
              text: constants.txtRequestJoin,
              image: asset.icJoin,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
