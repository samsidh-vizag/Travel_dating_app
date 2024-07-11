import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class UpcomingToursListviewWidget extends StatelessWidget {
  const UpcomingToursListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final boxShadow = AppTheme.of(context).boxShadow;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(
            spaces.space_100,
          ),
          child: Row(
            children: [
              Container(
                width: spaces.space_150 * 10,
                height: spaces.space_150 * 16,
                decoration: BoxDecoration(
                  color: colors.secondary,
                  boxShadow: [boxShadow.secondary],
                  borderRadius: BorderRadius.circular(
                    spaces.space_100,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(spaces.space_150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: spaces.space_125,
                        ),
                        child: Container(
                          width: spaces.space_100 * 12,
                          height: spaces.space_100 * 12,
                          decoration: BoxDecoration(
                            color: colors.textSubtle,
                            borderRadius: BorderRadius.circular(
                              spaces.space_100,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Place',
                        style: typography.h500,
                      ),
                      Text(
                        'Time',
                        style: typography.h200,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
