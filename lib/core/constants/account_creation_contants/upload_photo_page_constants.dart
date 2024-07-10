import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_photo_page_constants.g.dart';

class UploadPhotoPageConstants {
  final String txtHeading = 'Upload Your Photo';
  final String txtSubHeading =
      'we’d love to see you. Upload a photo for your dating journey ';
  final String txtComplete = 'Complete';
  final String txtAddImage = 'Add Image';
}

@riverpod
UploadPhotoPageConstants uploadPhotoPageConstants(
    UploadPhotoPageConstantsRef ref) {
  return UploadPhotoPageConstants();
}
