import 'package:dio/dio.dart';
import 'package:flutter_application_socialhub/core/network/error_mapper.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio});

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      return await dio.get(path, queryParameters: queryParameter);
    } on DioException catch (e) {
      throw ErrorMapper.fromDioException(e);
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      return await dio.post(path, data: data, queryParameters: queryParameter);
    } on DioException catch (e) {
      throw ErrorMapper.fromDioException(e);
    }
  }
}
