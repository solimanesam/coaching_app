import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/auth/data/data_source/auth_local_data_source/auth_local_data_source.dart';
import 'package:coaching_app/features/auth/data/data_source/remore_data_source/auth_remote_data_source.dart';
import 'package:coaching_app/features/auth/data/models/auth_model.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepo extends BaseAuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepo(
      {required this.authLocalDataSource, required this.authRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> forgetPassword(
      {required AuthParameter authParameter}) async {
    try {
      await authRemoteDataSource.forgetPassword(authParameter: authParameter);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> logIn(
      {required AuthParameter authParameter}) async {
    try {
      final AuthModel result =
          await authRemoteDataSource.logIn(authParameter: authParameter);
      await authLocalDataSource.cacheToken(result.token);
      await authLocalDataSource.cacheRole(result.role);

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(
      {required AuthParameter authParameter}) async {
    try {
      await authRemoteDataSource.signUp(authParameter: authParameter);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
