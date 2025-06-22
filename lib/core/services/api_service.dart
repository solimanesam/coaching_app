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
      options:await _buildOptions(apiServiceInputModel),
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
      options:await _buildOptions(apiServiceInputModel),
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
      options:await _buildOptions(apiServiceInputModel),
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
        headers:await _resolveHeaders(headersType),
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
        headers:await _resolveHeaders(headersType),
        contentType: Headers.multipartFormDataContentType,
      ),
    );
    return response.data;
  }

  // ✅ بناء Options من الـ model
  Future<Options> _buildOptions(ApiServiceInputModel model) async {
  final headers = await _resolveHeaders(model.apiHeaders);
  return Options(
    headers: headers,
    contentType: switch (model.apiContentType) {
      ApiContentTypeEnum.applicationJson => Headers.jsonContentType,
      ApiContentTypeEnum.applicationXWwwFormUrlencoded => Headers.formUrlEncodedContentType,
      ApiContentTypeEnum.multipartFormData => Headers.multipartFormDataContentType,
    },
  );
}


  // ✅ حل headers حسب نوعه
 Future<Map<String, dynamic>> _resolveHeaders(ApiHeadersEnum type) async {
  switch (type) {
    case ApiHeadersEnum.backEndHeadersWithoutToken:
      return {'Accept': 'application/json'};

    case ApiHeadersEnum.backEndHeadersWithToken:
      final token = await locator<BaseCache>().getStringFromCache(key: CacheConstant.tokenKey);
      print("🛡️ Actual token from cache: $token");
      return {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
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
