import 'package:music_player/datasources/api_constants.dart';
import 'package:music_player/datasources/api_service.dart';
import 'package:music_player/datasources/dtos/showdto.dart';
import 'package:music_player/models/show.dart';

class ShowRepository {
  Future<List<Show>> getShowList() async {
    var response = await APIService().get(APIConstants.showsUrl);
    final jsonData = response as List;
    var listDto = jsonData.map((tagJson) => ShowDto.fromJson(tagJson)).toList();
    var musicList = listDto.map((e) => Show.fromDto(e)).toList();
    return musicList;
  }
}
