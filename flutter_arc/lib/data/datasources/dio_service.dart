import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioService {
  static DioService? _instance;
  late Dio dio;

  DioService._internal() {
    dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 60)));
    // ✅ Add logging interceptor
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        error: true,
        logPrint: (log) =>
            debugPrint(log.toString()), // Use debugPrint to avoid truncation
      ),
    );
  }

  factory DioService() {
    _instance ??= DioService._internal();
    return _instance!;
  }
}
