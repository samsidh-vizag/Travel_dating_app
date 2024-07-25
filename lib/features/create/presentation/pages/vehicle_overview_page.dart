import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/vehicle_overview_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/features/create/presentation/pages/create_schedule_page.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/features_container_widget.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/row_widget.dart';

class VehicleOverviewPage extends ConsumerWidget {
  static const routePath = '/vehicle';
  const VehicleOverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(vehicleOverviewPageConstantsProvider);
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [BackArrowButton()],
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: PageTitleWidget(title: constants.txtVehicleDetails),
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: spaces.space_300,
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: spaces.space_500 * 6,
                  decoration: BoxDecoration(
                    color: colors.textSubtle,
                    borderRadius: BorderRadius.circular(
                      spaces.space_150,
                    ),
                  ),
                ),
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: Text(
                  "Vehicle Name",
                  style: typography.h700,
                ),
              ),
              const SizedBox8Widget(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: spaces.space_300,
                ),
                child: Row(
                  children: [
                    Image.asset(asset.icSter),
                    Text(
                      " 4.5",
                      style: typography.h500,
                    ),
                  ],
                ),
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeaturesContainerWidget(
                        image: asset.imgSeat, text: "5 Seats"),
                    FeaturesContainerWidget(
                        image: asset.imgDoor, text: " 4 Doors"),
                    FeaturesContainerWidget(
                        image: asset.imgManual, text: "Manual"),
                    FeaturesContainerWidget(image: asset.imgAc, text: "A/C"),
                  ],
                ),
              ),
              const SizedBox24Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: Text(
                  constants.txtVehicleFeaturse,
                  style: typography.h700,
                ),
              ),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.textSubtlest,
                    borderRadius: BorderRadius.circular(
                      spaces.space_150,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(spaces.space_200),
                    child: Column(
                      children: [
                        RowWidget(text: constants.txtModel, value: 'M1123A1'),
                        RowWidget(text: constants.txtCapacity, value: '12 L'),
                        RowWidget(text: constants.txtColor, value: 'Red'),
                        RowWidget(
                            text: constants.txtFuelType, value: 'Petrole'),
                        RowWidget(text: constants.txtSpeed, value: '100KM/H'),
                        RowWidget(text: constants.txtPower, value: '265 KM'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox24Widget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: const WidgetStatePropertyAll(0),
                          backgroundColor:
                              WidgetStatePropertyAll(colors.secondary),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(color: colors.primary),
                              borderRadius:
                                  BorderRadius.circular(spaces.space_100),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          constants.txtCancel,
                          style: typography.uiSemibold
                              .copyWith(color: colors.primary),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: spaces.space_200,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: const WidgetStatePropertyAll(0),
                          backgroundColor:
                              WidgetStatePropertyAll(colors.primary),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(spaces.space_100),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.push(CreateSchedulePage.routePath);
                        },
                        child: Text(
                          constants.txtSelect,
                          style: typography.uiSemibold
                              .copyWith(color: colors.secondary),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
