import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({Dio? dioClient}) : dio = dioClient ?? Dio();

  // GET
  Future<Response> get(
    String url, {
    String? token,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: _buildHeaders(token, headers)),
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  // POST
  Future<Response> post(
    String url, {
    String? token,
    Map<String, dynamic>? headers,
    dynamic data,
    bool isJson = true,
  }) async {
    try {
      return await dio.post(
        url,
        data: data,
        options: Options(
          headers: _buildHeaders(token, headers),
          contentType: isJson
              ? Headers.jsonContentType
              : Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  // POST with FormData (e.g., for images)
  Future<Response> postFormData(
    String url, {
    required String token,
    required FormData formData,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await dio.post(
        url,
        data: formData,
        options: Options(
          headers: _buildHeaders(token, headers),
          contentType: Headers.multipartFormDataContentType,
        ),
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  // PATCH
  Future<Response> patch(
    String url, {
    required String token,
    Map<String, dynamic>? headers,
    dynamic data,
    bool isJson = true,
  }) async {
    try {
      return await dio.patch(
        url,
        data: data,
        options: Options(
          headers: _buildHeaders(token, headers),
          contentType: isJson
              ? Headers.jsonContentType
              : Headers.formUrlEncodedContentType,
        ),
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Helpers

  Map<String, dynamic> _buildHeaders(
      String? token, Map<String, dynamic>? headers) {
    final Map<String, dynamic> finalHeaders = {
      'Accept': 'application/json',
      ...?headers,
    };

    if (token != null && token.trim().isNotEmpty) {
      finalHeaders['Authorization'] = 'Bearer $token';
    }

    return finalHeaders;
  }

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      final message = error.response?.data ?? error.message;
      return Exception('Dio Error: $message');
    }
    return Exception('Unexpected error: $error');
  }
}
