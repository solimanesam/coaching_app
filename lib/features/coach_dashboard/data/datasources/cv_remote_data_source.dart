import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/coach_dashboard/data/models/cv_model.dart';
import 'package:coaching_app/features/coach_dashboard/domain/repos/cv_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CvRemoteDataSource {
  Future<CvModel> getCv();
  Future<Unit> deleteCv({required CvParameters cvParameters});
  Future<Unit> uploadCv({required CvParameters cvParameters});
}

class CvRemoteDataSourceImpl extends CvRemoteDataSource {
  final ApiService apiService;

  CvRemoteDataSourceImpl({required this.apiService});
  @override
  Future<Unit> deleteCv({required CvParameters cvParameters}) {
    // TODO: implement deleteCv
    throw UnimplementedError();
  }

  @override
  Future<CvModel> getCv() async {
    try {
      final response = await apiService.get(
          apiServiceInputModel: ApiServiceInputModel(
        url: ApiConstants.getCvUrl,
        apiHeaders: ApiHeadersEnum.backEndHeadersWithToken,
      ));
      return CvModel.fromJson(json: response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Unit> uploadCv({required CvParameters cvParameters}) async {
    try {
      final formData = FormData.fromMap({
        'CVFile': await MultipartFile.fromFile(
          cvParameters.filePath,
          filename: cvParameters.filePath.split('/').last,
        ),
      });

      await apiService.postFormData(
        url: ApiConstants.uploadCvUrl,
        formData: formData,
        headersType: ApiHeadersEnum.backEndHeadersWithToken,
      );

      return unit;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
