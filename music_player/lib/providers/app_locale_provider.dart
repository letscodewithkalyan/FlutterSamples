import 'package:flutter/material.dart';

class AppLocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Locale get locale => _locale;
  void changeLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
