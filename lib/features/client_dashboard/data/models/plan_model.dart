import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';

class PlanModel extends PlanEntity {
  const PlanModel({
    required super.id,
    required super.coach,
    required super.price,
    required super.durationInDays,
    required super.details,
    required super.createdDate,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'] as int,
      coach: CoachEntity(
        userName: json['coach']['userName'] as String,
        email: json['coach']['email'] as String,
      ),
      price: (json['price'] as num).toInt(),
      durationInDays: json['durationInDays'] as int,
      details: json['details'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coach': {
        'userName': coach.userName,
        'email': coach.email,
      },
      'price': price,
      'durationInDays': durationInDays,
      'details': details,
      'createdDate': createdDate.toIso8601String(),
    };
  }
}
