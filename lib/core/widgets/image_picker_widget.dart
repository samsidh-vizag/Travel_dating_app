import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_dating_app/core/utils/image_picker_utils.dart';

class ImagePickerWidget extends ConsumerWidget {
  final Widget? widgets;
  final String identifier;
  const ImagePickerWidget({
    super.key,
    required this.widgets,
    required this.identifier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Path of the image picked
    final imagePathPicked = ref.watch(imageProvider(identifier))?.path;

    /// Image to show if the image is already picked
    Widget? imageToShow;

    if (imagePathPicked != null && imagePathPicked.startsWith('http')) {
      imageToShow = Image.network(
        imagePathPicked,
        fit: BoxFit.cover,
      );
    } else if (imagePathPicked != null) {
      imageToShow = Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: FileImage(
              File(imagePathPicked),
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () async {
        final imageSelected =
            await ImagePickerUtils.showDialogueForImagePicker(context);
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        ref.read(imageProvider(identifier).notifier).state = imageSelected;
      },
      child: imageToShow ?? widgets,
    );
  }
}

final imageProvider =
    StateNotifierProvider.family<ImageProviderNotifier, XFile?, String>(
        (ref, identifier) {
  return ImageProviderNotifier();
});

class ImageProviderNotifier extends StateNotifier<XFile?> {
  ImageProviderNotifier() : super(null);
}
