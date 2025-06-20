import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/client_dashboard/data/models/profile_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRemoreDataSource {
  Future<ProfileModel> getProfile();
  Future<Unit> editProfile({required ProfileEntity profileEntity});
}

class ProfileRemoreDataSourceImpl extends ProfileRemoreDataSource {
  final ApiService apiService;

  ProfileRemoreDataSourceImpl({required this.apiService});
  @override
  Future<Unit> editProfile({required ProfileEntity profileEntity}) async {
    try {
      await apiService.patch(
          apiServiceInputModel: ApiServiceInputModel(
              url: ApiConstants.editProfilrUrl,
              apiHeaders: ApiHeadersEnum.backEndHeadersWithToken,
              body: {
            'email': profileEntity.email,
            'username': profileEntity.userName,
            'age': profileEntity.age,
            'height': profileEntity.height,
            'weight': profileEntity.weight
          }));
      return unit;
    } catch (e) {
      throw ServerException(message: e.toString());
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
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
