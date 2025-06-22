import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/coach_dashboard/data/datasources/cv_remote_data_source.dart';
import 'package:coaching_app/features/coach_dashboard/domain/entities/cv_entity.dart';
import 'package:coaching_app/features/coach_dashboard/domain/repos/cv_base_repo.dart';
import 'package:dartz/dartz.dart';

class CvRepo extends CvBaseRepo {
  final CvRemoteDataSource cvRemoteDataSource;

  CvRepo({required this.cvRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> deleteCv(
      {required CvParameters cvParameters}) async {
    try {
      await cvRemoteDataSource.deleteCv(cvParameters: cvParameters);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CvEntity>> getCv() async {
    try {
      final result = await cvRemoteDataSource.getCv();
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadCv(
      {required CvParameters cvParameters}) async {
    try {
      await cvRemoteDataSource.uploadCv(cvParameters: cvParameters);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
