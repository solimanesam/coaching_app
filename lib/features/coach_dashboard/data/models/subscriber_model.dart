import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';

class SubscriberModel extends Subscriber {
  const SubscriberModel({
    required super.height,
    required super.weight,
    required super.name,
    required super.email,
  });

  factory SubscriberModel.fromJson(Map<String, dynamic> json) {
    // التحقق من وجود بيانات حقيقية
    if (json['userName'] == null || json['email'] == null) {
      throw Exception("Invalid subscriber data");
    }

    return SubscriberModel(
      name: json["userName"] ?? '',
      email: json["email"] ?? '',
      height: json["height"] ?? 0,
      weight: json["weight"] ?? 0,
    );
  }
}
