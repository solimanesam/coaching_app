import 'package:equatable/equatable.dart';

class CoachEntity extends Equatable {
  final String? message;
  final String userName;
  final String email;
  final List<String>? roles;
  final String? phoneNumber;
  final int age;
  final int weight;
  final int height;
  final String gender;
  final String? profileImageUrl;
  final String? cvFileName;
  final String? cvViewUrl;
  final String? cvDownloadUrl;
  final DateTime? cvUploadDate;

  const CoachEntity({
    this.phoneNumber,
    this.message,
    required this.userName,
    required this.email,
    this.roles,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
    this.profileImageUrl,
    this.cvFileName,
    this.cvViewUrl,
    this.cvDownloadUrl,
    this.cvUploadDate,
  });

  @override
  List<Object?> get props => [
        message,
        userName,
        email,
        roles,
        age,
        weight,
        height,
        gender,
        profileImageUrl,
        cvFileName,
        cvViewUrl,
        cvDownloadUrl,
        cvUploadDate,
      ];
}
