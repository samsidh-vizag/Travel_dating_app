import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class UserProfileGridviewWidget extends StatelessWidget {
  const UserProfileGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return GridView.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: spaces.space_500 * 6,
        crossAxisSpacing: spaces.space_300,
        mainAxisSpacing: spaces.space_300,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.textSubtle,
                borderRadius: BorderRadius.circular(
                  spaces.space_150,
                ),
              ),
            ),
            Positioned(
              top: spaces.space_100,
              left: spaces.space_100,
              child: Container(
                width: spaces.space_200 * 6,
                height: spaces.space_400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    spaces.space_100,
                  ),
                  color: colors.secondary.withOpacity(.6),
                ),
                child: Center(
                  child: Text("12 KM Away"),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  height: spaces.space_100 * 9,
                  width: MediaQuery.sizeOf(context).width / 2.3,
                  decoration: BoxDecoration(
                    color: colors.secondary.withOpacity(.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Name",
                        style: typography.h600,
                      ),
                      Text(
                        "place",
                      ),
                    ],
                  )),
            ),
          ],
        );
      },
    );
  }
}
