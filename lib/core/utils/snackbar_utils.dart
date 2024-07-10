import 'package:flutter/material.dart';
import 'package:travel_dating_app/main.dart';

class SnackBarUtils {
  static void showMessage(String content) {
    MyApp.scaffoldMessengerKey.currentState!
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
