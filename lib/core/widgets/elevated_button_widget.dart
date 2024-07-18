import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';

class ElevatedButtonWidget extends ConsumerWidget {
  final String text;
  final Color color;
  final void Function() onPressed;
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: appTheme.spaces.space_300,
          horizontal: appTheme.spaces.space_300),
      child: SizedBox(
        height: appTheme.spaces.space_600,
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                backgroundColor:
                    WidgetStatePropertyAll(appTheme.colors.primary),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(appTheme.spaces.space_150)))),
            onPressed: onPressed,
            child: Text(
              text,
              style: appTheme.typography.uiSemibold
                  .copyWith(color: appTheme.colors.secondary),
            )),
      ),
    );
  }
}
