import 'package:flutter_more/models/show.dart';
import 'package:flutter_more/repositories/show_repository.dart';
import 'package:get/get.dart';

class ShowController extends GetxController {
  var isLoading = false.obs;
  var shows = <Show>[].obs;

  @override
  void onInit() {
    loadShows();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future loadShows() async {
    try {
      isLoading(true);
      var showsList = await ShowRepository().getShows();
      shows.value = showsList;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
