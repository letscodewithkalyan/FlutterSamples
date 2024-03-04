import 'dart:convert';
import 'package:flutter_mvvm/data/app_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ApiService {
  Future getResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return returnReponse(response);
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future postResponse(String url, Map<String, String>? body) async {
    try {
      final response = await http.post(Uri.parse(url), body: body);
      return returnReponse(response);
    } catch (ex) {
      print(ex.toString());
    }
  }

  dynamic returnReponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
