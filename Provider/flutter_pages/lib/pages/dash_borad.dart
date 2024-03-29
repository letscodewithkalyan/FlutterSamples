import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Demo"),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(icon: Icon(Icons.directions_bike))
            ]),
          ),
          body: const TabBarView(children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike)
          ]),
        ));
  }
}
