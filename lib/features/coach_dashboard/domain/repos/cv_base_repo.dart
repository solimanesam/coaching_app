import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/coach_dashboard/domain/entities/cv_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CvBaseRepo {
  Future<Either<Failure, CvEntity>> getCv();
  Future<Either<Failure, Unit>> deleteCv({required CvParameters cvParameters});
  Future<Either<Failure, Unit>> uploadCv({required CvParameters cvParameters});
}

class CvParameters {
  final String filePath;

  CvParameters({required this.filePath});
}
