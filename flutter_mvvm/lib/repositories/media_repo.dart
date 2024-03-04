import 'package:flutter_mvvm/data/api_constants.dart';
import 'package:flutter_mvvm/data/api_service.dart';
import 'package:flutter_mvvm/models/apis/api_response.dart';
import 'package:flutter_mvvm/models/apis/media.dart';

class MusicRepository {
  ApiService _apiService = ApiService();
  Future<List<Media>> fetchMusic(String searchTerm) async {
    dynamic response =
        await _apiService.getResponse(ApiConstants.MediaUrl + searchTerm);
    final jsonData = response['results'] as List;
    var mediaList = jsonData.map((tagJson) => Media.fromJson(tagJson)).toList();
    return mediaList;
  }
}
