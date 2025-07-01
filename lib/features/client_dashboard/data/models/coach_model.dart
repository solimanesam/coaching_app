import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';

class CoachModel extends CoachEntity {
  const CoachModel(
      {super.message,
      required super.userName,
      required super.email,
      super.roles,
      required super.age,
      required super.weight,
      required super.height,
      required super.gender,
      super.profileImageUrl,
      super.cvFileName,
      super.cvViewUrl,
      super.cvDownloadUrl,
      super.cvUploadDate,
      super.phoneNumber});

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
      phoneNumber: json['phoneNumber'],
      message: json['message'],
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
      age: json['age'] ?? 0,
      weight: json['weight'] ?? 0,
      height: json['height'] ?? 0,
      gender: json['gender'] ?? '',
      profileImageUrl: json['profileImageUrl'],
      cvFileName: json['cvFileName'],
      cvViewUrl: json['cvViewUrl'],
      cvDownloadUrl: json['cvDownloadUrl'],
      cvUploadDate: json['cvUploadDate'] != null
          ? DateTime.tryParse(json['cvUploadDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userName': userName,
      'email': email,
      'roles': roles,
      'age': age,
      'weight': weight,
      'height': height,
      'gender': gender,
      'profileImageUrl': profileImageUrl,
      'cvFileName': cvFileName,
      'cvViewUrl': cvViewUrl,
      'cvDownloadUrl': cvDownloadUrl,
      'cvUploadDate': cvUploadDate?.toIso8601String(),
    };
  }
}
