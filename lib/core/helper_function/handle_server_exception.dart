import 'package:coaching_app/core/errors/failures.dart';
import 'package:dio/dio.dart';

Failure handelServerException(Object e) {
  if (e is DioException) {
    return ServerFailure.fromDiorError(e);
  }
  return const ServerFailure('Opps There was an Error, Please try again');
}
