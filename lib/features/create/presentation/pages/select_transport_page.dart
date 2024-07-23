import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/transport_select_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/features_container_widget.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/transport_items_gridview_widget.dart';

class SelectTransportPage extends ConsumerWidget {
  static const routePath = '/selectTransport';
  const SelectTransportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    ///constants
    final constants = ref.watch(transportSelectPageConstantsProvider);
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
                  children: [
                    BackArrowButton(),
                  ],
                ),
                const SizedBox16Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: PageTitleWidget(
                    title: constants.txtSelect,
                  ),
                ),
                const SizedBox8Widget(),
                SizedBox(
                  height: spaces.space_500 * 10,
                  child: const TransportItemsGridviewWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
