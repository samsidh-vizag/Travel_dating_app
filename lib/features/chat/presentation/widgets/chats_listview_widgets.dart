import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class ChatsListviewWidgets extends StatelessWidget {
  const ChatsListviewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(spaces.space_100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: spaces.space_100 * 10,
                      width: spaces.space_100 * 10,
                      decoration: BoxDecoration(
                        color: colors.textSubtle,
                        borderRadius: BorderRadius.circular(
                          spaces.space_100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: spaces.space_300),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: typography.h500,
                          ),
                          const Text("massage"),
                        ],
                      ),
                    ),
                  ],
                ),
                const Text('00:00 AM'),
              ],
            ),
          ),
        );
      },
    );
  }
}
