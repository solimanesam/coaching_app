import 'package:coaching_app/features/coach_dashboard/data/models/cv_model.dart';
import 'package:coaching_app/features/coach_dashboard/domain/repos/cv_base_repo.dart';
import 'package:dartz/dartz.dart';

abstract class CvRemoteDataSource {
  Future<CvModel> getCv();
  Future<Unit> deleteCv({required CvParameters cvParameters});
  Future<Unit> uploadCv({required CvParameters cvParameters});
}
class CvRemoteDataSourceImpl extends CvRemoteDataSource{
  @override
  Future<Unit> deleteCv({required CvParameters cvParameters}) {
    // TODO: implement deleteCv
    throw UnimplementedError();
  }

  @override
  Future<CvModel> getCv() {
    // TODO: implement getCv
    throw UnimplementedError();
  }

  @override
  Future<Unit> uploadCv({required CvParameters cvParameters}) {
    // TODO: implement uploadCv
    throw UnimplementedError();
  }
}