import 'package:dio/dio.dart';
import 'package:flutter_application_socialhub/core/network/network_exception.dart';

abstract final class ErrorMapper {
  static NetworkException fromDioException(DioException exception) {
    final statusCode = exception.response?.statusCode;

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Connection timed out. Please try again.',
        );

      case DioExceptionType.connectionError:
        return const NetworkException(message: 'No internet connection.');

      case DioExceptionType.badResponse:
        return NetworkException(
          message: _messageFromStatusCode(statusCode),
          statusCode: statusCode,
        );

      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request was cancelled.');

      case DioExceptionType.badCertificate:
        return const NetworkException(message: 'Secure connection failed.');

      case DioExceptionType.unknown:
        return NetworkException(
          message: exception.message ?? 'Something went wrong.',
          statusCode: statusCode,
        );
      case DioExceptionType.transformTimeout:
        return const NetworkException(message: 'Transform timeout.');
    }
  }

  static String _messageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized request.';
      case 403:
        return 'Access denied.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
