import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/features/create/presentation/pages/driver_overview_page.dart';

class DriversGridViewWidget extends StatelessWidget {
  const DriversGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  context.push(DriverOverviewPage.routePath);
                },
                child: Container(
                  width: theme.spaces.space_100 * 12,
                  height: theme.spaces.space_100 * 12,
                  decoration: BoxDecoration(
                    color: theme.colors.textSubtle,
                    borderRadius: BorderRadius.circular(
                      theme.spaces.space_100,
                    ),
                  ),
                ),
              ),
              Text(
                "Name",
                style: theme.typography.h500,
              )
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: theme.spaces.space_100 * 16,
          mainAxisSpacing: theme.spaces.space_75,
        ),
      ),
    );
  }
}
