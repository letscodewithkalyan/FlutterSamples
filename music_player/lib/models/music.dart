import 'package:music_player/datasources/dtos/musicdto.dart';

class Music {
  late String wrapperType;
  late String artistName;
  late String collectionName;
  late String trackName;
  late String artistViewUrl;
  late String collectionViewUrl;
  late String trackViewUrl;
  late String previewUrl;
  late String artworkUrl100;
  Music(
      {required this.wrapperType,
      required this.artistName,
      required this.artistViewUrl,
      required this.collectionName,
      required this.artworkUrl100,
      required this.collectionViewUrl,
      required this.previewUrl,
      required this.trackName,
      required this.trackViewUrl});

  Music.fromDto(MusicDto musicDto) {
    wrapperType = musicDto.wrapperType ?? "";
    artistName = musicDto.artistName ?? "";
    artistViewUrl = musicDto.artistViewUrl ?? "";
    collectionName = musicDto.collectionName ?? "";
    artworkUrl100 = musicDto.artworkUrl100 ?? "";
    collectionViewUrl = musicDto.collectionViewUrl ?? "";
    previewUrl = musicDto.previewUrl ?? "";
    trackName = musicDto.trackName ?? "";
    trackViewUrl = musicDto.trackViewUrl ?? "";
  }
}
