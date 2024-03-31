import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_more/views/album_view.dart';
import 'package:flutter_more/views/home_view.dart';

class MoreTabView extends StatefulWidget {
  const MoreTabView({super.key});

  @override
  State<MoreTabView> createState() => _MoreTabViewState();
}

class _MoreTabViewState extends State<MoreTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          bottom: TabBar(tabs: [
            Tab(
              text: "Album",
            ),
            Tab(
              text: "Shows",
            )
          ]),
        ),
        body: TabBarView(children: [AlbumView(), HomeView()]),
      ),
    );
  }
}
