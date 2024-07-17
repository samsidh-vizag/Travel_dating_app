import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: spaces.space_500 * 5,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: BoxDecoration(
            color: colors.textInverse,
            borderRadius: BorderRadius.circular(
              spaces.space_150,
            ),
          ),
        );
      },
    );
  }
}
