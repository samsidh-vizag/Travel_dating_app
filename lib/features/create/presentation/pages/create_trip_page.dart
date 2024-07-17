import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class CreateTripPage extends StatelessWidget {
  static const routePath = '/create';
  const CreateTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

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
      ),
    );
  }
}
