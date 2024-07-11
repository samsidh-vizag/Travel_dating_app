import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class StoryViewListviewWidget extends StatelessWidget {
  const StoryViewListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsets.only(left: spaces.space_100, right: spaces.space_100),
          child: Column(
            children: [
              Container(
                width: spaces.space_700,
                height: spaces.space_700,
                decoration: BoxDecoration(
                  color: colors.textSubtle,
                  borderRadius: BorderRadius.circular(
                    spaces.space_100,
                  ),
                ),
              ),
              Text(
                'Name',
                style: typography.h400,
              ),
            ],
          ),
        );
      },
    );
  }
}
