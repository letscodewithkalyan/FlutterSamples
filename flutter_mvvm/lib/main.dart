import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/viewmodels/images_viewmodel.dart';
import 'package:flutter_mvvm/presentation/viewmodels/login_viewmodel.dart';
import 'package:flutter_mvvm/presentation/views/count_view.dart';
import 'package:flutter_mvvm/presentation/views/images_view.dart';
import 'package:flutter_mvvm/presentation/views/login_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImagesViewmodel()),
        ChangeNotifierProvider(create: (_) => LoginViewmodel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/images',
      routes: {
        '/counter': (context) => const CountView(),
        '/images': (context) => const ImagesView(),
        '/login': (context) => const LoginView(),
      },
    );
  }
}
