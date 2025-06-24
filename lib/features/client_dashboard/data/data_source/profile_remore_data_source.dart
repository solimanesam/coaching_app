import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/client_dashboard/data/models/profile_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/profile_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoreDataSource {
  Future<ProfileModel> getProfile();
  Future<Unit> editProfile({required ProfileParameters profileParameters});
}

class ProfileRemoreDataSourceImpl extends ProfileRemoreDataSource {
  final ApiService apiService;

  ProfileRemoreDataSourceImpl({required this.apiService});
  @override
  Future<Unit> editProfile({required ProfileParameters profileParameters}) async {
    try {
      await apiService.patch(
          apiServiceInputModel: ApiServiceInputModel(
              url: ApiConstants.editProfilrUrl,
              apiHeaders: ApiHeadersEnum.backEndHeadersWithToken,
              body: {
            'email': profileParameters.email,
            'userName': profileParameters.userName,
            
            'height': profileParameters.height,
            'weight': profileParameters.weight
          }));
      return unit;
    }on DioException catch (e) {
      print(e.response?.data.toString());
      throw ServerException(message: e.response?.data);
    }
  }

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await apiService.get(
          apiServiceInputModel: ApiServiceInputModel(
              url: ApiConstants.getProfileUrl,
              apiHeaders: ApiHeadersEnum.backEndHeadersWithToken));
      return ProfileModel.fromJson(response);
    }on DioException catch (e) {
      print(e.toString());
      throw ServerException(message: e.toString());
    }
  }
}
