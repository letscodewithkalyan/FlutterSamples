import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_arc/core/api_constants.dart';
import 'package:flutter_arc/data/datasources/api_response.dart';

class ApiService {
  Future<APIResponse<T>> getData<T>(String endpoint) async {
    try {
      final dio = Dio();
      final url = '${ApiConstants.baseURL}/$endpoint';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return APIResponse<T>(data: response.data);
      } else {
        return APIResponse<T>(
          error: 'Failed to load data: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<T>(error: 'Failed to load data: $e');
    }
  }

  Future<APIResponse<T>> postData<T>(String endpoint, Object? body) async {
    try {
      final dio = Dio();

      final response = await dio.post(
        '${ApiConstants.baseURL}/$endpoint',
        data: body,
      );
      if (response.statusCode == 200) {
        return APIResponse<T>(data: json.decode(response.data) as T);
      } else {
        return APIResponse<T>(error: 'Failed to post data');
      }
    } catch (e) {
      return APIResponse<T>(error: 'Failed to post data');
    }
  }
}
