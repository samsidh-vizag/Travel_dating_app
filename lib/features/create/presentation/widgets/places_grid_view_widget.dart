import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class PlacesGridViewWidget extends StatelessWidget {
  const PlacesGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: theme.spaces.space_100 * 12,
              height: theme.spaces.space_100 * 12,
              decoration: BoxDecoration(
                color: theme.colors.textSubtle,
                borderRadius: BorderRadius.circular(
                  theme.spaces.space_100,
                ),
              ),
            ),
            Text(
              "Place",
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
    );
  }
}
