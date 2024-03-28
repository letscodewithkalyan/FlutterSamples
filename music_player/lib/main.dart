import 'package:flutter/material.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/datasources/user_preferences.dart';
import 'package:music_player/navigator_key.dart';
import 'package:music_player/providers/app_locale_provider.dart';
import 'package:music_player/viewmodels/login_viewmodel.dart';
import 'package:music_player/viewmodels/musiclist_viewmodel.dart';
import 'package:music_player/views/home_view.dart';
import 'package:music_player/views/language_view.dart';
import 'package:music_player/views/login_view_two.dart';
import 'package:music_player/views/register_view.dart';
import 'package:music_player/views/widgets/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Future<String?> getUserData() =>
      UserPreferences().getString(Constants.LANGUAGE_KEY);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicListViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AppLocaleProvider())
      ],
      child: Consumer<AppLocaleProvider>(
        builder: (context, locale, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              //home: LoadingOverlay(child: MusicListView()),
              home: const LoadingOverlay(child: LanguageView()),
              locale: locale.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routes: getRoutes());
        },
      ),
    );
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      "/language": (context) => LanguageView(),
      "/login": (context) => LoginViewTwo(),
      "/register": (context) => RegisterView(),
      "/home": (context) => HomeView(currentIndex: 0),
    };
  }
}
