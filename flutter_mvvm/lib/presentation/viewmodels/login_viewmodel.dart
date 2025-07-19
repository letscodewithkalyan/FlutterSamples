import 'package:flutter/material.dart';

class LoginViewmodel extends ChangeNotifier {
  String? userName;
  String? password;
  String? passwordError;

  void checkPasswordValidation() {
    RegExp exp = RegExp(r"^[$&+,:;=?@#|'<>.^*()%!-]");
    if (password != null && !exp.hasMatch(password!)) {
      passwordError = "Password should contains atleast one special charatecrs";
    } else {
      passwordError = "";
    }
    notifyListeners();
  }
}
