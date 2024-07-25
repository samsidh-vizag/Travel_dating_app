import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class ImageButton extends StatelessWidget {
  final String assetText;
  final String buttonText;
  final void Function()? onTap;

  const ImageButton({
    super.key,
    required this.assetText,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            spaces.space_100,
          ),
          border: Border.all(
            width: .7,
            color: colors.primary,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: spaces.space_100, vertical: spaces.space_50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: SvgPicture.asset(
                  assetText,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(spaces.space_100),
                child: Text(
                  buttonText,
                  style: typography.h400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
