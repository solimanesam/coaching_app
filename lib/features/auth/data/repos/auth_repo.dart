import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/auth/data/remore_data_source/auth_remote_data_source.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepo extends BaseAuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepo({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> forgetPassword(
      {required AuthParameter authParameter}) async {
    try {
      await authRemoteDataSource.forgetPassword(authParameter: authParameter);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> logIn(
      {required AuthParameter authParameter}) async {
    try {
      final String token =
          await authRemoteDataSource.logIn(authParameter: authParameter);
      return right(token);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(
      {required AuthParameter authParameter}) async {
    try {
      await authRemoteDataSource.signUp(authParameter: authParameter);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
