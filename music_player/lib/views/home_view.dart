import 'package:flutter/material.dart';
import 'package:music_player/views/artist_view.dart';
import 'package:music_player/views/musiclist_view.dart';

class HomeView extends StatefulWidget {
  int currentIndex = 0;
  HomeView({super.key, required this.currentIndex});
  static const navigation = <NavigationDestination>[
    NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    NavigationDestination(icon: Icon(Icons.music_note), label: "Music")
  ];

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int drawerIndex = 0;
  final page = [const MusicListView(), const ArtisView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomeView.navigation[drawerIndex].label),
      ),
      drawer: NavigationDrawer(
        selectedIndex: drawerIndex,
        onDestinationSelected: (value) => {
          setState(() {
            drawerIndex = value;
          }),
        },
        children: const [
          NavigationDrawerDestination(
              icon: Icon(Icons.home), label: Text("Home")),
          NavigationDrawerDestination(
              icon: Icon(Icons.music_note), label: Text("Music"))
        ],
      ),
      body: page[drawerIndex],
      bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(indicatorColor: Colors.white),
          child: NavigationBar(
            destinations: HomeView.navigation,
            selectedIndex: drawerIndex,
            onDestinationSelected: (value) {
              setState(() {
                drawerIndex = value;
              });
            },
          )),
    );
  }
}
