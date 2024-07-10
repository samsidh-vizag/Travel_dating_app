import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/utils/snackbar_utils.dart';

class ImagePickerUtils {
  static Future<XFile?> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      SnackBarUtils.showMessage("No Image picked");
      return null;
    }
  }

  static Future<XFile?> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      SnackBarUtils.showMessage("No Image picked");
      return null;
    }
  }

  static Future<XFile?> showDialogueForImagePicker(BuildContext context,
      [bool showDeleteOption = false]) async {
    final imageCompleter = Completer<XFile?>();
    await showDialog(
      context: context,
      builder: (context) {
        final theme = AppTheme.of(context);

        return AlertDialog(
          backgroundColor: theme.colors.secondary,
          title: Column(
            children: [
              TextButton(
                  onPressed: () async {
                    imageCompleter.complete(
                        await ImagePickerUtils.pickImageFromCamera(context));
                    context.pop();
                  },
                  child: const Text(
                    "Camera",
                  )),
              TextButton(
                  onPressed: () async {
                    imageCompleter.complete(
                      await ImagePickerUtils.pickImageFromGallery(context),
                    );
                    context.pop();
                  },
                  child: const Text(
                    "Gallery",
                  )),

              /// Show the delete option if required
              if (showDeleteOption)
                TextButton(
                  onPressed: () async {
                    /// An empty path is given to remove the selected image
                    imageCompleter.complete(XFile(''));
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Delete",
                  ),
                ),
            ],
          ),
        );
      },
    );

    return imageCompleter.future;
  }
}
