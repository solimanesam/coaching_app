import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel(
      {required super.userName,
      required super.email,
      required super.age,
      required super.weight,
      required super.height});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userName: json['userName'],
      email: json['email'],
      age: json['age'],
      weight: json['weight'],
      height: json['height'],
    );
  }
}
