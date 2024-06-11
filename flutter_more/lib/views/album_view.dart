import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_more/controllers/show_controller.dart';
import 'package:get/get.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    ShowController showController = Get.put<ShowController>(ShowController());
    return Scaffold(
      appBar: AppBar(title: const Text("Albums")),
      body: Obx(
        () {
          if (showController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return PageView.builder(
            pageSnapping: true,
            itemCount: showController.shows.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Image.network(showController.shows[index].mediumImage),
              );
            },
          );
        },
      ),
    );
  }
}
