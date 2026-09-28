import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('request ${options.method} ${options.path}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('${response.statusCode}${response.requestOptions.uri}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('${err.requestOptions.method}${err.requestOptions.uri}');
      debugPrint(' Error: ${err.message}');
      debugPrint(' Status: ${err.response?.statusCode}');
    }
    handler.next(err);
  }
}
