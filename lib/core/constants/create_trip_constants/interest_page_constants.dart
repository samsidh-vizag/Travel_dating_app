import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'interest_page_constants.g.dart';

class InterestPageConstants {
  final String txtHeading = 'Interests';
  final String txtSubHeading =
      'Select a few of your interests and let everyone know what you’re passionate about.';
  final String txtReading = 'Reading';
  final String txtPhotography = 'Photography';
  final String txtGaming = 'Gaming';
  final String txtMusic = 'Music';
  final String txtTravel = 'Travel';
  final String txtPainting = 'Painting';
  final String txtPolitics = 'Politics';
  final String txtCharity = 'Charity';
  final String txtCooking = 'Cooking';
  final String txtPets = 'Pets';
  final String txtSports = 'Sports';
  final String txtFashion = 'Fashion';
  final String txtSkip = 'Skip';
}

@riverpod
InterestPageConstants interestPageConstants(InterestPageConstantsRef ref) {
  return InterestPageConstants();
}
