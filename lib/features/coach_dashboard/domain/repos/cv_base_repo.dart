import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/coach_dashboard/domain/entities/cv_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CvBaseRepo {
  Future<Either<Failure, CvEntity?>> getCv();
  Future<Either<Failure, Unit>> deleteCv();
  Future<Either<Failure, Unit>> uploadCv({required CvInputModel cvParameters});
}

class CvInputModel {
  const CvInputModel({required this.filePath});

  final String filePath;

  Future<FormData> toJson() async {
    return FormData.fromMap({
      'CVFile': await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      ),
    });
  }
}
