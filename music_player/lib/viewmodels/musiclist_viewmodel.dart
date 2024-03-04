import 'package:flutter/material.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/repository/music_repository.dart';
import 'package:music_player/views/widgets/loading_overlay.dart';

class MusicListViewModel extends ChangeNotifier {
  final _musicRepository = MusicRepository();
  List<Music> musicList = List.empty();

  Future loadMusicList(String keyword, BuildContext context) async {
    LoadingOverlay.of(context).show();
    var list = await _musicRepository.getMusicList(keyword);
    musicList = list;
    notifyListeners();
    LoadingOverlay.of(context).hide();
  }
}
