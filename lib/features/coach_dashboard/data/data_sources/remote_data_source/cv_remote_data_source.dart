import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/constants/cache_constant.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/cv_model.dart';
import 'package:coaching_app/features/coach_dashboard/domain/repos/cv_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CvRemoteDataSource {
  Future<CvModel?> getCv();
  Future<Unit> deleteCv();
  Future<void> uploadCv({required CvInputModel cvParameters});
}

class CvRemoteDataSourceImpl extends CvRemoteDataSource {
  final ApiService apiService;

  CvRemoteDataSourceImpl({required this.apiService});
  @override
  Future<Unit> deleteCv() async {
    try {
      await apiService.delete(
          apiServiceInputModel: ApiServiceInputModel(
        url: ApiConstants.deleteCvUrl,
        apiHeaders: ApiHeadersEnum.backEndHeadersWithToken,
      ));
      return unit;
    } on DioException catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  final dio = Dio();
  @override
  Future<CvModel?> getCv() async {
    try {
      final response = await dio.get(
        ApiConstants.getCvUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization':
                'Bearer ${await locator<BaseCache>().getStringFromCache(key: CacheConstant.tokenKey)}',
          },
          // ✅ عشان ميرميش استثناء لو 404
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      final data = response.data;

      if (response.statusCode == 200 && data['succeeded'] == true) {
        return CvModel.fromJson(json: data);
      } else if (response.statusCode == 404 ||
          data['message'] == "No CV found.") {
        return null; // 🟡 معناها مفيش CV
      } else {
        throw Exception('Unexpected response: ${data['message']}');
      }
    } catch (e) {
      print('❌ Dio Error: $e');
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> uploadCv({required CvInputModel cvParameters}) async {
    await apiService.postFormData(
      url: ApiConstants.uploadCvUrl,
      formData: await cvParameters.toJson(),
      headersType: ApiHeadersEnum.backEndHeadersWithToken,
    );
  }
}
