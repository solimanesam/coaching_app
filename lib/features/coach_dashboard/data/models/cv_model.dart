import 'package:coaching_app/features/coach_dashboard/domain/entities/cv_entity.dart';

class CvModel extends CvEntity {
  const CvModel({required super.downloadCv, required super.openCv});
  factory CvModel.fromJson({required Map<String, dynamic> json}) =>
      CvModel(downloadCv: json['downloadlink'], openCv: json['viewlink']);
}
