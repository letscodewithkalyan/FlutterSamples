import 'package:flutter/material.dart';
import 'package:flutter_more/controllers/show_controller.dart';
import 'package:flutter_more/models/show.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  ShowController showController = Get.put<ShowController>(ShowController());
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    List<Show> showsList = showController.shows;
    return Scaffold(
        appBar: AppBar(title: Text("Shows")),
        body: Obx(() {
          if (showController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: showsList.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Stack(children: [
                    Image.network(showsList[index].mediumImage),
                  ]),
                );
              });
        }));
  }
}
