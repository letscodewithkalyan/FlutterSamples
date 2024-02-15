import 'package:flutter/material.dart';
import 'package:flutter_pages/pages/dash_borad.dart';
import 'package:flutter_pages/pages/login_page.dart';
import 'package:flutter_pages/pages/register.dart';
import 'package:flutter_pages/providers/auth_provider.dart';
import 'package:flutter_pages/utils/user_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String?> getUserData() => UserPreferences().getString("user");

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.data == null) {
                  return LoginPage();
                } else {
                  return DashBoardPage();
                }
            }
          },
        ),
        routes: {
          '/dashboard': (context) => DashBoardPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegistrationPage()
        },
      ),
    );
  }
}
