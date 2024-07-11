import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_permission_page_constatns.g.dart';

class LocationPermissionPageConstatns {
  final String txtHeading = 'Enable Your Location';
  final String txtSubHeading =
      'Choose your location to start find people around you';
  final String txtAllow = 'Allow Location Access';
  final String txtManually = 'Enter Location Manually';
}

@riverpod
LocationPermissionPageConstatns locationPermissionPageConstatns(
    LocationPermissionPageConstatnsRef ref) {
  return LocationPermissionPageConstatns();
}
