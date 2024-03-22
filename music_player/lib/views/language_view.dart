import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/datasources/user_preferences.dart';
import 'package:music_player/models/app_language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_locale_provider.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  AppLocaleProvider? _appLocale;
  int tappedIndex = -1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appLocale = Provider.of<AppLocaleProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Language")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: AppLanuage.getSupportedLanguages().length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Flag.fromCode(
                      AppLanuage.getSupportedLanguages()[index].flagsCode,
                      width: 30,
                      height: 30,
                    ),
                    title: Text(
                      AppLanuage.getSupportedLanguages()[index].languageName,
                    ),
                    onTap: () => {
                      setState(
                        () {
                          tappedIndex = index;
                        },
                      ),
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: tappedIndex == index
                              ? Colors.blue
                              : Colors.grey[300]!,
                          width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                if (tappedIndex > -1) {
                  final selectedLaguage =
                      AppLanuage.getSupportedLanguages()[tappedIndex];
                  await UserPreferences().saveString(
                      Constants.LANGUAGE_KEY, selectedLaguage.languageCode);
                  _appLocale!
                      .changeLocale(Locale(selectedLaguage.languageCode));
                  await Navigator.pushNamed(context, "/login");
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              child: const Text("Next"))
        ],
      ),
    );
  }
}
