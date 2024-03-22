import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/app_language.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  int tappedIndex = -1;
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
                physics: BouncingScrollPhysics(),
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
              onPressed: () {
                Navigator.pushNamed(context, "/login");
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
