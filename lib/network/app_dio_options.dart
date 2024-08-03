import 'package:dio/dio.dart';

class AppDioOptions {
  final String baseUrl;
  final Map<String, dynamic> headers;

  AppDioOptions({ required this.baseUrl, required this.headers });

  BaseOptions toBaseOptions() {
    return BaseOptions(baseUrl: baseUrl, headers: headers);
  }
}