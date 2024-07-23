import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'driver_overview_page_constants.g.dart';

class DriverOverviewPageConstants {
  final String txtDriverDetails = 'Driver Details';
  final String txtDetails = 'Details';
  final String txtReview = 'Review';
  final String txtDrivingId = 'Driving ID';
  final String txtPhoneNumber = 'Phone Number';
  final String txtEmail = 'Email';
  final String txtAddress = 'address';
  final String txtSelect = 'Select';
  final String txtCancel = 'Cancel';
}

@riverpod
DriverOverviewPageConstants driverOverviewPageConstants(
    DriverOverviewPageConstantsRef ref) {
  return DriverOverviewPageConstants();
}
