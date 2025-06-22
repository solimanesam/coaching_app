import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/client_dashboard/data/models/coach_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/dashboard_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DashboardRemoteDataSource {
  Future<List<CoachModel>> getCoaches();
  Future<Unit> editImage({required ImageParameter imageParameter});
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  DashboardRemoteDataSourceImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<CoachModel>> getCoaches() async {
    try {
      final response = await apiService.get(
        apiServiceInputModel: ApiServiceInputModel(
          url: ApiConstants.coachesUrl,
          apiHeaders: ApiHeadersEnum.backEndHeadersWithToken,
        ),
      );

      return List<CoachModel>.from(
        (response['data'] as List).map((x) => CoachModel.fromJson(x)),
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Unit> editImage({required ImageParameter imageParameter}) async {
    try {
      final formData = FormData.fromMap({
        'Image': await MultipartFile.fromFile(
          imageParameter.imageFile,
          filename: imageParameter.imageFile.split('/').last,
        ),
      });

      await apiService.patchFormData(
        url: ApiConstants.editImageUrl,
        formData: formData,
        headersType: ApiHeadersEnum.backEndHeadersWithToken,
      );

      return unit;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
