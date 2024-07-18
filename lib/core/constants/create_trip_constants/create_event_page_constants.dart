import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_event_page_constants.g.dart';

class CreateEventPageConstants {
  final String txtAddimage = 'Add Image';
  final String txtTripTitle = 'Trip Title';
  final String txtTripDetails = 'Trip Details';
  final String txtStartDate = 'Start Date';
  final String txtEndDate = 'End Date';
  final String txtSchedule = 'Create trip schedule';
  final String txtContinue = 'Continue';
  final String txtEnterTripTitle = 'Enter trip title';
  final String txtEnterTripDetails = 'Enter trip details';
  final String txtDate = 'DD-MM-YYYY';
}

@riverpod
CreateEventPageConstants createEventPageConstants(
    CreateEventPageConstantsRef ref) {
  return CreateEventPageConstants();
}
