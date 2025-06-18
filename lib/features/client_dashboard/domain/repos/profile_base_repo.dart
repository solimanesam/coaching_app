import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileBaseRepo {
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, Unit>> editProfile(
      {required ProfileEntity profileEntity});
}
