import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_constatns.g.dart';

class HomePageConstatns {
  final String txtTitle = 'Create and Find Your Trip';
  final String txtSearch = 'Search';
  final String txtOpenTour = 'Open Tour';
  final String txtUpcomingTour = 'Upcoming Tours';
  final String txtViewAll = 'View All';
  final String txtNearBy = 'Near By Tours Hosted';
  final String txtTraveler = 'Travelers Near You';
}

@riverpod
HomePageConstatns homePageConstatns(HomePageConstatnsRef ref) {
  return HomePageConstatns();
}
