import 'package:dio/dio.dart';

class DioService {
  static DioService? _dioService;
  late Dio dio;
  DioService._internal() {
    dio = Dio();
  }

  factory DioService() {
    _dioService ??= DioService._internal();
    return _dioService!;
  }
}
