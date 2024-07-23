import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_schedule_page_constants.g.dart';

class CreateSchedulePageConstants {
  final String txtDone = 'Done';
  final String txtDay = 'Day';
  final String txtFrom = 'From';
  final String txtTo = 'To';
  final String txtTime = 'Time';
  final String txtBudget = 'Budget';
  final String txtActivities = 'Activities';
  final String txtTimeSchedule = 'Time Schedule';
  final String txtStartTime = 'Start Time';
  final String txtEndTime = 'End Time';
  final String txtAddTransport = 'Transport';
  final String txtAddDriver = 'Driver';
  final String txtAddAnother = 'Add Another Destination';
  final String txtOk = 'OK';
  final String txtHoeMany = 'How many people are included in this trip?';
}

@riverpod
CreateSchedulePageConstants createSchedulePageConstants(
    CreateSchedulePageConstantsRef ref) {
  return CreateSchedulePageConstants();
}
