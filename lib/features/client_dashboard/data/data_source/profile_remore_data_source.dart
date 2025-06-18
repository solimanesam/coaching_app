import 'package:coaching_app/features/client_dashboard/data/models/profile_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRemoreDataSource {
  Future<ProfileModel> getProfile();
  Future<Unit> editProfile({required ProfileEntity profileEntity});
}
class ProfileRemoreDataSourceImpl extends ProfileRemoreDataSource{
  @override
  Future<Unit> editProfile({required ProfileEntity profileEntity}) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }
  
}