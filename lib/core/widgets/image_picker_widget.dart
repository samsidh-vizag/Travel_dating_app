import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_dating_app/core/utils/image_picker_utils.dart';

final imageProvider = StateProvider<XFile?>((ref) {
  return null;
});

class ImagePickerWidget extends ConsumerWidget {
  final Widget? widgets;
  const ImagePickerWidget({
    super.key,
    required this.widgets,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Path of the image picked
    final imagePathPicked = ref.watch(imageProvider)?.path;

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
                fit: BoxFit.cover)
            // shape: BoxShape.circle,
            ),
      );
    }

    return InkWell(
        onTap: () async {
          final imageSelected =
              await ImagePickerUtils.showDialogueForImagePicker(context);
          ref.read(imageProvider.notifier).state = imageSelected;
        },
        child: imageToShow ?? widgets);
  }
}
