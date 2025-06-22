import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String userName;
  final String email;
 

  const ProfileEntity(
      {required this.userName,
      required this.email,
      });

  @override
  List<Object?> get props => [userName, email,];
}
