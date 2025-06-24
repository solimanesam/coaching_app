import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/profile_remore_data_source.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/profile_base_repo.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo extends ProfileBaseRepo {
  final ProfileRemoreDataSource profileRemoreDataSource;

  ProfileRepo({required this.profileRemoreDataSource});
  @override
  Future<Either<Failure, Unit>> editProfile(
      {required ProfileParameters profileParameters}) async {
    try {
      await profileRemoreDataSource.editProfile(profileParameters: profileParameters);
      return right(unit);
    }on ServerException catch (e) {
      return left(Failure( e.message));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final result = await profileRemoreDataSource.getProfile();
      return right(result);
    }on ServerException catch (e) {
      return left(Failure( e.toString()));
    }
  }
}
