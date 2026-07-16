import 'package:clean_architecture_app/core/network/api_header.dart';
import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: ApiHeader.header(),
        ),
      ) {
    // Add logging or auth interceptors here if needed
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  // Generic GET request helper
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Custom error handler to map Dio errors to friendly exceptions
  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception("Connection timed out. Please try again.");
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        return Exception(
          "Server error: $statusCode. ${error.response?.statusMessage}",
        );
      case DioExceptionType.connectionError:
        return Exception("No internet connection.");
      default:
        return Exception("Something went wrong. Please try again.");
    }
  }
}
