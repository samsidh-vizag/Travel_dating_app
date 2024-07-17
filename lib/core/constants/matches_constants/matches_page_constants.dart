import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'matches_page_constants.g.dart';

class MatchesPageConstants {
  final String txtAll = 'All';
  final String txtOnline = 'Online';
  final String txtNearest = 'Nearest';
  final String txtNewest = 'Newest';
}

@riverpod
MatchesPageConstants matchesPageConstants(MatchesPageConstantsRef ref) {
  return MatchesPageConstants();
}
