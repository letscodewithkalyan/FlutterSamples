import 'package:music_player/datasources/api_constants.dart';
import 'package:music_player/datasources/api_service.dart';
import 'package:music_player/datasources/dtos/musicdto.dart';
import 'package:music_player/models/music.dart';

class MusicRepository {
  Future<List<Music>> getMusicList(String searchWord) async {
    var response = await APIService().get(APIConstants.MediaUrl + searchWord);
    final jsonData = response['results'] as List;
    var listDto =
        jsonData.map((tagJson) => MusicDto.fromJson(tagJson)).toList();
    var musicList = listDto.map((e) => Music.fromDto(e)).toList();
    return musicList;
  }
}
