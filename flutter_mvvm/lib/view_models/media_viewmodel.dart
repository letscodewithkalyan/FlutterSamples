import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/apis/api_response.dart';
import 'package:flutter_mvvm/models/apis/media.dart';
import 'package:flutter_mvvm/repositories/media_repo.dart';

class MediaViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  Media? _media;
  ApiResponse get response {
    return _apiResponse;
  }

  Media? get media {
    return _media;
  }

  Future<void> fetchMediaData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      List<Media> mediaList = await MusicRepository().fetchMusic(value);
      _apiResponse = ApiResponse.completed(mediaList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setSelectedMedia(Media? media) {
    _media = media;
    notifyListeners();
  }
}
