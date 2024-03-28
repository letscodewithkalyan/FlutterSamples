import 'package:flutter/material.dart';
import 'package:music_player/models/show.dart';
import 'package:music_player/repository/show_repository.dart';

class ArtistViewModel extends ChangeNotifier {
  final _showRepository = ShowRepository();
  List<Show> showsList = List.empty();

  Future loadShows() async {
    showsList = await _showRepository.getShowList();
    notifyListeners();
  }
}
