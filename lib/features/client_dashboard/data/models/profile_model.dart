import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel(
      {required super.userName,
      required super.email,
     });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userName: json['userName'],
      email: json['email'],
     
    );
  }
}
