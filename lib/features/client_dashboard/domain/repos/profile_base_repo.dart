import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileBaseRepo {
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, Unit>> editProfile(
      {required ProfileParameters profileParameters});
}

class ProfileParameters {
  final String email;
  final String userName;
  final int height;
  final int weight;
  ProfileParameters({
    required this.email,
    required this.userName,
    required this.height,
    required this.weight,
  });
}
