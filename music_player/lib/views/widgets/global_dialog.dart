import 'package:flutter/material.dart';
import 'package:music_player/navigator_key.dart';

class GlobalDialog {
  static showAlertDialog(String text) {
    showDialog(
        barrierDismissible: false,
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
