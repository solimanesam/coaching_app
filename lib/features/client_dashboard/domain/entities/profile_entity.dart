import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String userName;
  final String email;
  final String? image;

  const ProfileEntity({
    required this.image,
    required this.userName,
    required this.email,
  });

  @override
  List<Object?> get props => [userName, email, image];
}
