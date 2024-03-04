import 'package:flutter_mvvm/data/api_constants.dart';
import 'package:flutter_mvvm/data/api_service.dart';
import 'package:flutter_mvvm/models/apis/api_response.dart';

class LoginRepository {
  ApiService _apiService = ApiService();

  Future<ApiResponse> login(String username, String password) async {
    var body = {"username": username, "password": password};
    dynamic reponse =
        await _apiService.postResponse(ApiConstants.LoginUrl, body);
    return ApiResponse.completed(reponse);
  }
}
