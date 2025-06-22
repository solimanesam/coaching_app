import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';

class PlanModel extends PlanEntity {
  const PlanModel(
      {required super.id,
      required super.coachId,
      required super.coach,
      required super.price,
      required super.durationInDays,
      required super.details,
      required super.createdDate});

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'] as int,
      coachId: json['coachId'] as String,
      coach: json['coach'] as String,
      price: json['price'] as int,
      durationInDays: json['durationInDays'] as int,
      details: json['details'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coachId': coachId,
      'coach': coach,
      'price': price,
      'durationInDays': durationInDays,
      'details': details,
      'createdDate': createdDate.toIso8601String(),
    };
  }
}
