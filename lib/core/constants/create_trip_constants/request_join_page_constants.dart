import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'request_join_page_constants.g.dart';

class RequestJoinPageConstants {
  final String txtTours = 'Tours';
  final String txtAll = 'All';
  final String txtUpcoming = 'Upcoming';
  final String txtNearest = 'Nearest';
}

@riverpod
RequestJoinPageConstants requestJoinPageConstants(
    RequestJoinPageConstantsRef ref) {
  return RequestJoinPageConstants();
}
