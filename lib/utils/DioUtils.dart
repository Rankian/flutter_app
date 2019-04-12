import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DioUtils {
  static Dio _dio;
  var numFormat = NumberFormat();

  static void _initDio({String contentType = 'application/json'}) {
    print("contentType:$contentType");
    Options options = new Options();
    options.baseUrl = "https://api2.bmob.cn";
    options.connectTimeout = 30000;
    options.receiveTimeout = 30000;

    Map<String, dynamic> header = new Map();
    header["X-Bmob-Application-Id"] = "6f6fa7d55c805137aa0b2a937c13ae77";
    header["X-Bmob-REST-API-Key"] = "c891efaeb691c3a40426d8b2b408da47";
    header["Content-Type"] = contentType;
    options.headers = header;

    _dio = new Dio(options);
    _dio.interceptor.request.onSend = (Options options) {
      print("Dio：请求中, ${options.path}, ${options.contentType},${options.data.toString()}");
      return options;
    };
    _dio.interceptor.response.onSuccess = (Response response) {
      print("Dio：请求成功：${json.encode(response.data)}");
      return response;
    };
    _dio.interceptor.response.onError = (DioError error) {
      print("Dio：请求失败:${error.response.statusCode},${error.message}");
      return error;
    };
  }

  static Dio get({String contentType = 'application/json'}) {
    if (_dio == null) _initDio(contentType: contentType);
    return _dio;
  }

  static Future<Response> download(String urlPath, String savePath) async {
    _dio = new Dio();
    Response response = await _dio.download(urlPath, savePath, onProgress: (int received, int total) {
      var percent = received.toDouble() / total.toDouble();
      print("下载中：${(percent * 100).toStringAsFixed(0)}%");
      if(percent == 1){
        _installApk(savePath);
      }
    });
    return response;
  }

  static Future<void> _installApk(String filePath) async {
    const platform = const MethodChannel('flutter_app');
    await platform.invokeMethod('install', {'path': filePath});
  }
}
