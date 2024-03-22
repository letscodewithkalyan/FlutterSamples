import 'package:flag/flag.dart';

class AppLanuage {
  bool isSelected = false;
  String languageName;
  String languageCode;
  FlagsCode flagsCode;

  AppLanuage(
      {required this.languageName,
      required this.languageCode,
      required this.flagsCode});

  static List<AppLanuage> getSupportedLanguages() {
    return [
      AppLanuage(
          languageName: "English", languageCode: "en", flagsCode: FlagsCode.US),
      AppLanuage(
          languageName: "Telugu", languageCode: "te", flagsCode: FlagsCode.IN),
      AppLanuage(
          languageName: "French", languageCode: "fr", flagsCode: FlagsCode.FR),
    ];
  }
}
