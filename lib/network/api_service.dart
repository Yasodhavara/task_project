import 'package:dio/dio.dart';

abstract class ApiService {

  // https://jsonplaceholder.typicode.com/posts
  Future<Response> getMethod(String url);
  Future<Response> postMethod(String url, Object? data);

}