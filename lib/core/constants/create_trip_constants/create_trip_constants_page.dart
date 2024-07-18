import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_trip_constants_page.g.dart';

class CreateTripConstantsPage {
  final String txtHeading = 'Explore New Adventures';
  final String txtSubHeading = 'Create a new trip or join a trip';
  final String txtCreateTrip = 'Create a New Trip';
  final String txtRequestJoin = 'Request Join';
}

@riverpod
CreateTripConstantsPage createTripConstantsPage(
    CreateTripConstantsPageRef ref) {
  return CreateTripConstantsPage();
}
