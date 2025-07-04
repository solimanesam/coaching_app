import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/coach_dashboard/data/data_sources/remote_data_source/cv_remote_data_source.dart';
import 'package:coaching_app/features/coach_dashboard/domain/entities/cv_entity.dart';
import 'package:coaching_app/features/coach_dashboard/domain/repos/cv_base_repo.dart';
import 'package:dartz/dartz.dart';

class CvRepo extends CvBaseRepo {
  final CvRemoteDataSource cvRemoteDataSource;

  CvRepo({required this.cvRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> deleteCv(
     ) async {
    try {
      await cvRemoteDataSource.deleteCv();
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CvEntity?>> getCv() async {
    try {
      final result = await cvRemoteDataSource.getCv();
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadCv(
      {required CvInputModel cvParameters}) async {
    try {
      await cvRemoteDataSource.uploadCv(cvParameters: cvParameters);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
