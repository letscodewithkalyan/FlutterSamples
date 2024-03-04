import 'package:flutter/material.dart';
import 'package:flutter_mvvm/views/music_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Apple music"),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.music_note)),
              Tab(icon: Icon(Icons.music_video)),
              Tab(icon: Icon(Icons.camera_alt)),
            ]),
          ),
          body: const TabBarView(children: [
            MusicView(),
            Icon(Icons.music_video),
            Icon(Icons.camera_alt)
          ]),
        ));
  }
}
