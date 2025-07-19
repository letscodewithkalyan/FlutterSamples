import 'package:flutter_mvvm/core/api_constants.dart';
import 'package:flutter_mvvm/data/datasources/api_response.dart';
import 'package:flutter_mvvm/data/datasources/dio_service.dart';

class APIService {
  Future<ApiResponse<T>> getData<T>(String endpoint) async {
    //Check the network connection before call
    try {
      var apiResponse = await DioService().dio.get(
        "${ApiConstants.baseUrl}/$endpoint",
      );
      if (apiResponse.statusCode == 200) {
        return ApiResponse.success(data: apiResponse.data);
      } else if (apiResponse.statusCode == 404) {
        return ApiResponse.error(error: "Not Found");
      } else if (apiResponse.statusCode == 401) {
        return ApiResponse.error(error: "Unauthorized");
      } else if (apiResponse.statusCode! >= 500) {
        return ApiResponse.error(error: "Server error");
      } else {
        return ApiResponse.error(error: "Unexpected error");
      }
    } catch (e) {
      return ApiResponse.error(error: "Exception: ${e.toString()}");
    }
  }
}
