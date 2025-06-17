import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';

class CoachModel extends CoachEntity {
  const CoachModel({required super.image, required super.name});

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(name: json['name'], image: json['image']);
  }
}
