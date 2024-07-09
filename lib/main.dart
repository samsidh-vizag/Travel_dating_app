import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/router/router.dart';
import 'package:travel_dating_app/core/theme/light_theme.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
