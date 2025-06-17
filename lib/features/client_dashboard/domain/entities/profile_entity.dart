import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String userName;
  final String email;
  final String age;
  final String weight;
  final String height;

  const ProfileEntity(
      {required this.userName,
      required this.email,
      required this.age,
      required this.weight,
      required this.height});

  @override
  List<Object?> get props => [userName, email, age, weight, height];
}
