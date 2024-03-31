import 'package:flutter_more/datasource/dtos/show_dto.dart';

class Show {
  late String name;
  late String language;
  late String mediumImage;
  late String originalImage;

  Show.fromDto(ShowDto showDto) {
    name = showDto.name ?? "";
    language = showDto.language ?? "";
    mediumImage = showDto.image?.medium ?? "";
  }
}
