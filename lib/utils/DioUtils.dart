import 'package:dio/dio.dart';

class DioUtils {
  static Dio _dio;

  static void _initDio() {
    Options options = new Options();
    options.baseUrl = "https://api2.bmob.cn";
    options.connectTimeout = 5000;
    options.receiveTimeout = 5000;

    Map<String, dynamic> header = new Map();
    header["X-Bmob-Application-Id"] = "6f6fa7d55c805137aa0b2a937c13ae77";
    header["X-Bmob-REST-API-Key"] = "c891efaeb691c3a40426d8b2b408da47";
    header["Content-Type"] = "application/json";
    options.headers = header;

    _dio = new Dio(options);
  }

  static Dio get() {
    if (_dio == null) _initDio();
    return _dio;
  }
}
