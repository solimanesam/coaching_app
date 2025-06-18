
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DashboardBaseRepo {
  Future<Either<Failure, List<CoachEntity>>> getCoaches();

  Future<Either<Failure, Unit>> editImage(
      {required ImageParameter imageParameter});
}

class ImageParameter {
  final  String imageFile;

  ImageParameter({required this.imageFile});
}
