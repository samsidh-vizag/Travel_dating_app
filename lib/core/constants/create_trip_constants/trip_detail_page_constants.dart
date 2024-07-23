import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trip_detail_page_constants.g.dart';

class TripDetailPageConstants {
  final String txtEventDetails = 'Event Details';
  final String txtPublic = 'Public';
  final String txtPrivate = 'Private';
  final String txtInvite = 'Invite';
  final String txtBudget = 'Budget';
  final String txtOrganizer = 'Organizer';
  final String txtConfirmAnd = 'Confirm And Create ';
  final String txtViewTrip = 'View Trip Schedule';
  final String txtShare = 'Share';
}

@riverpod
TripDetailPageConstants tripDetailPageConstants(
    TripDetailPageConstantsRef ref) {
  return TripDetailPageConstants();
}
