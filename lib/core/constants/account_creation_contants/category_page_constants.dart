import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_page_constants.g.dart';

class CategoryPageConstants {
  final String txtHeading = '''I'm Looking For...''';
  final String txtSubHeading =
      'Provide us with further insights into  your preferences';
  final String txtRelationship = 'A relationship';
  final String txtSomething = 'Somthing casual';
  final String txtNotsure = '''I'm not sure yet''';
  final String txtPrefer = 'Prefer not to say';
}

@riverpod
CategoryPageConstants categoryPageConstants(CategoryPageConstantsRef ref) {
  return CategoryPageConstants();
}
