import 'package:flutter/material.dart';
import 'package:flutter_arc/presentation/pages/address_page.dart';
import 'package:flutter_arc/presentation/pages/home_page.dart';
import 'package:flutter_arc/presentation/pages/images_page.dart';
import 'package:flutter_arc/presentation/pages/login_page.dart';
import 'package:flutter_arc/presentation/widgets/loading_overlay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: "Title",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const HomePage(),
        '/address': (context) => const AddressPage(),
        '/image': (context) => const ImagesPage(),
      },
    );
  }
}
