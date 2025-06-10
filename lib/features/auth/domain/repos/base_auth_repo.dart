import 'package:coaching_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, Unit>> signUp({required AuthParameter authParameter});
  Future<Either<Failure, String>> logIn({required AuthParameter authParameter});
  Future<Either<Failure, Unit>> forgetPassword(
      {required AuthParameter authParameter});
}

class AuthParameter {
  AuthParameter(
      {this.gender,
      this.userName,
      this.isCoach,
      this.age,
      this.weight,
      this.height,
      required this.email,
      this.password});
  final String email;
  final String? gender;
  final String? password;
  final String? userName;
  final bool? isCoach;
  final int? age;
  final int? weight;
  final int? height;
}
