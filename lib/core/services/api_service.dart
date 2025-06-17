import 'package:coaching_app/core/constants/cache_constant.dart';
import 'package:coaching_app/core/constants/secret_keys.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  // ✅ POST
  Future<Map<String, dynamic>> post({
    required ApiServiceInputModel apiServiceInputModel,
  }) async {
    final response = await dio.post(
      apiServiceInputModel.url,
      data: apiServiceInputModel.body,
      options: _buildOptions(apiServiceInputModel),
    );
    return response.data;
  }

  // ✅ GET
  Future<Map<String, dynamic>> get({
    required ApiServiceInputModel apiServiceInputModel,
  }) async {
    final response = await dio.get(
      apiServiceInputModel.url,
      queryParameters: apiServiceInputModel.body,
      options: _buildOptions(apiServiceInputModel),
    );
    return response.data;
  }

  // ✅ PATCH
  Future<Map<String, dynamic>> patch({
    required ApiServiceInputModel apiServiceInputModel,
  }) async {
    final response = await dio.patch(
      apiServiceInputModel.url,
      data: apiServiceInputModel.body,
      options: _buildOptions(apiServiceInputModel),
    );
    return response.data;
  }

  // ✅ POST FormData
  Future<Map<String, dynamic>> postFormData({
    required String url,
    required FormData formData,
    required ApiHeadersEnum headersType,
  }) async {
    final response = await dio.post(
      url,
      data: formData,
      options: Options(
        headers: _resolveHeaders(headersType),
        contentType: Headers.multipartFormDataContentType,
      ),
    );
    return response.data;
  }

  // ✅ PATCH FormData
  Future<Map<String, dynamic>> patchFormData({
    required String url,
    required FormData formData,
    required ApiHeadersEnum headersType,
  }) async {
    final response = await dio.patch(
      url,
      data: formData,
      options: Options(
        headers: _resolveHeaders(headersType),
        contentType: Headers.multipartFormDataContentType,
      ),
    );
    return response.data;
  }

  // ✅ بناء Options من الـ model
  Options _buildOptions(ApiServiceInputModel model) {
    return Options(
      headers: _resolveHeaders(model.apiHeaders),
      contentType: switch (model.apiContentType) {
        ApiContentTypeEnum.applicationJson => Headers.jsonContentType,
        ApiContentTypeEnum.applicationXWwwFormUrlencoded =>
          Headers.formUrlEncodedContentType,
        ApiContentTypeEnum.multipartFormData =>
          Headers.multipartFormDataContentType,
      },
    );
  }

  // ✅ حل headers حسب نوعه
  Map<String, dynamic> _resolveHeaders(ApiHeadersEnum type) {
    switch (type) {
      case ApiHeadersEnum.backEndHeadersWithoutToken:
        return {'Accept': 'application/json'};

      case ApiHeadersEnum.backEndHeadersWithToken:
        return {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${locator<BaseCache>().getStringFromCache(key: CacheConstant.tokenKey)}',
        };

      case ApiHeadersEnum.paymentHeaders:
        return {
          'Authorization': 'Bearer ${SecretKeys.stripeSecretKey}',
        };
    }
  }
}

enum ApiContentTypeEnum {
  applicationJson,
  applicationXWwwFormUrlencoded,
  multipartFormData,
}

enum ApiHeadersEnum {
  backEndHeadersWithoutToken,
  backEndHeadersWithToken,
  paymentHeaders,
}

class ApiServiceInputModel {
  final String url;
  final dynamic body;
  final ApiHeadersEnum apiHeaders;
  final ApiContentTypeEnum apiContentType;

  ApiServiceInputModel({
    required this.url,
    this.body,
    this.apiHeaders = ApiHeadersEnum.backEndHeadersWithoutToken,
    this.apiContentType = ApiContentTypeEnum.applicationJson,
  });
}
