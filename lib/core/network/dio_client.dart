import 'package:dio/dio.dart';
import 'package:flutter_application_socialhub/core/network/api_endpoint.dart';
import 'package:flutter_application_socialhub/core/network/dio_interceptors.dart';

class DioClient {
  final Dio dio;
  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoint.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          headers: const {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    dio.interceptors.add(DioInterceptors());
  }
}
