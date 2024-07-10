import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/select_category_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/create_account_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/select_interest_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/uploaad_photo_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/signin_with_number_page.dart';

part 'router.g.dart';

final router =
    GoRouter(initialLocation: SignInWithNumberPage.routePath, routes: [
  GoRoute(
    path: SignInWithNumberPage.routePath,
    builder: (context, state) => const SignInWithNumberPage(),
  ),
  GoRoute(
    path: SignUpPage.routePath,
    builder: (context, state) => const SignUpPage(),
  ),
  GoRoute(
    path: OtpVerificationPage.routePath,
    builder: (context, state) => const OtpVerificationPage(),
  ),
  GoRoute(
    path: CreateAccountPage.routePath,
    builder: (context, state) => const CreateAccountPage(),
  ),
  GoRoute(
    path: CategoryPage.routePath,
    builder: (context, state) => const CategoryPage(),
  ),
  GoRoute(
    path: SelectInterestPage.routePath,
    builder: (context, state) => const SelectInterestPage(),
  ),
  GoRoute(
    path: UploaadePhotoPage.routePath,
    builder: (context, state) => const UploaadePhotoPage(),
  ),
]);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
