import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';

class SubscriberModel extends Subscriber {
  const SubscriberModel({required super.name, required super.email});
  
  factory SubscriberModel.fromJson(Map<String, dynamic> json) {
    return SubscriberModel(name: json["name"], email: json["email"]);
  }
}
