import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/profile_base_repo.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo extends ProfileBaseRepo{
  @override
  Future<Either<Failure, Unit>> editProfile({required ProfileEntity profileEntity}) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }
}