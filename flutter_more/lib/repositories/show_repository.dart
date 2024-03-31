import 'dart:convert';

import 'package:flutter_more/datasource/api_constants.dart';
import 'package:flutter_more/datasource/dtos/show_dto.dart';
import 'package:flutter_more/models/show.dart';
import 'package:http/http.dart' as http;

class ShowRepository {
  Future<List<Show>> getShows() async {
    var reponse = await http.get(Uri.parse(ApiConstants.showsURL));
    var json = jsonDecode(reponse.body);
    var jsonList = json as List;
    var listDto = jsonList.map((e) => ShowDto.fromJson(e)).toList();
    return listDto.map((e) => Show.fromDto(e)).toList();
  }
}
