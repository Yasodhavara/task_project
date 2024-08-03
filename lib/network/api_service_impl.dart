import 'api_service.dart';
import 'package:dio/dio.dart';

class ApiServiceImpl implements ApiService {
  final Dio dio;
  ApiServiceImpl({required this.dio});

  @override
  Future<Response> getMethod(String url) {
    // TODO: implement getMethod
    final response = dio.get(url);
    return response;
  }

  @override
  Future<Response> postMethod(String url, Object? data) {
    // TODO: implement postMethod
    final response = dio.post(url,data: data);
    return response;
  }

}