import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/datasources/api_data/faker_api.dart';
import 'package:flutter_mvvm/data/models/image_model.dart';

class ImagesViewmodel extends ChangeNotifier {
  List<ImageModel>? images;
  String? errorMessage;
  bool isLoading = false;

  void loadData() async {
    isLoading = true;
    notifyListeners();
    var response = await FakerApi().getImagesData();
    if (response.data != null) {
      images = response.data;
    } else if (response.error != null) {
      errorMessage = response.error;
    }
    isLoading = false;
    notifyListeners();
  }

  void reorderListView(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final ImageModel item = images!.removeAt(oldIndex);
    images!.insert(newIndex, item);
    notifyListeners();
  }
}
