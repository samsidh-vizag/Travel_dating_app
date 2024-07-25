import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_dating_app/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/location_permission_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/select_category_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/create_account_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/select_interest_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/uploaad_photo_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:travel_dating_app/features/authentication/presentation/pages/signin_with_number_page.dart';
import 'package:travel_dating_app/features/chat/presentation/pages/chat_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/create_event_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/create_schedule_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/create_trip_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/driver_overview_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/interest_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/request_join_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/select_driver_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/select_transport_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/transport_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/trip_details_page.dart';
import 'package:travel_dating_app/features/create/presentation/pages/vehicle_overview_page.dart';
import 'package:travel_dating_app/features/home/presentation/pages/home_page.dart';
import 'package:travel_dating_app/features/matches/presentation/pages/matches_page.dart';
import 'package:travel_dating_app/features/notification/presentation/pages/notification_page.dart';
import 'package:travel_dating_app/features/profile/presentation/pages/edit_profil_page.dart';
import 'package:travel_dating_app/features/profile/presentation/pages/profile_page.dart';
import 'package:travel_dating_app/features/profile/presentation/pages/settings_page.dart';

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
    path: SignInPage.routePath,
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    path: OtpVerificationPage.routePath,
    builder: (context, state) => OtpVerificationPage(
      phone: state.extra as String,
    ),
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
  GoRoute(
    path: LocationPermissionPage.routePath,
    builder: (context, state) => const LocationPermissionPage(),
  ),
  GoRoute(
    path: BottomNaviWidget.routePath,
    builder: (context, state) => const BottomNaviWidget(),
  ),
  GoRoute(
    path: HomePage.routePath,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: ChatPage.routePath,
    builder: (context, state) => const ChatPage(),
  ),
  GoRoute(
    path: MatchesPage.routePath,
    builder: (context, state) => const MatchesPage(),
  ),
  GoRoute(
    path: CreateTripPage.routePath,
    builder: (context, state) => const CreateTripPage(),
  ),
  GoRoute(
    path: InterestPage.routePath,
    builder: (context, state) => const InterestPage(),
  ),
  GoRoute(
    path: CreateEventPage.routePath,
    builder: (context, state) => const CreateEventPage(),
  ),
  GoRoute(
    path: NotificationPage.routePath,
    builder: (context, state) => const NotificationPage(),
  ),
  GoRoute(
    path: ProfilePage.routePath,
    builder: (context, state) => const ProfilePage(),
  ),
  GoRoute(
    path: EditProfilPage.routePath,
    builder: (context, state) => const EditProfilPage(),
  ),
  GoRoute(
    path: CreateSchedulePage.routePath,
    builder: (context, state) => const CreateSchedulePage(),
  ),
  GoRoute(
    path: RequestJoinPage.routePath,
    builder: (context, state) => const RequestJoinPage(),
  ),
  GoRoute(
    path: SettingsPage.routePath,
    builder: (context, state) => const SettingsPage(),
  ),
  GoRoute(
    path: TransportPage.routePath,
    builder: (context, state) => const TransportPage(),
  ),
  GoRoute(
    path: SelectTransportPage.routePath,
    builder: (context, state) => const SelectTransportPage(),
  ),
  GoRoute(
    path: VehicleOverviewPage.routePath,
    builder: (context, state) => const VehicleOverviewPage(),
  ),
  GoRoute(
    path: SelectDriverPage.routePath,
    builder: (context, state) => const SelectDriverPage(),
  ),
  GoRoute(
    path: DriverOverviewPage.routePath,
    builder: (context, state) => const DriverOverviewPage(),
  ),
  GoRoute(
    path: TripDetailsPage.routePath,
    builder: (context, state) => const TripDetailsPage(),
  ),
]);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
