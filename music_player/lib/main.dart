import 'package:flutter/material.dart';
import 'package:music_player/navigator_key.dart';
import 'package:music_player/viewmodels/musiclist_viewmodel.dart';
import 'package:music_player/views/musiclist_view.dart';
import 'package:music_player/views/widgets/loading_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MusicListViewModel())],
      child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoadingOverlay(child: MusicListView())),
    );
  }
}
