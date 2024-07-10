import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_interest_page_constants.g.dart';

class SelectInterestPageConstants {
  final String txtHeading = 'Select Up To 3 Interest';
  final String txtSubHeading =
      'Tell us what piques  your curiosity and passions';
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
}

@riverpod
SelectInterestPageConstants selectInterestPageConstants(
    SelectInterestPageConstantsRef ref) {
  return SelectInterestPageConstants();
}
