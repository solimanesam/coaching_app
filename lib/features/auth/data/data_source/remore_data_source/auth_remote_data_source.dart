import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/auth/data/models/auth_model.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> signUp({required AuthParameter authParameter});
  Future<AuthModel> logIn({required AuthParameter authParameter});
  Future<Unit> forgetPassword({required AuthParameter authParameter});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Unit> forgetPassword({required AuthParameter authParameter}) async {
    try {
      await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
          url: ApiConstants.forgetPasswordUrl,
          body: {'email': authParameter.email},
        ),
      );
      return unit;
    } on DioException catch (e) {
      print(e.toString());
      throw ServerException(message: e.response?.data);
    }
  }

  @override
  Future<AuthModel> logIn({required AuthParameter authParameter}) async {
    try {
      final response = await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
          url: ApiConstants.logInUrl,
          body: {
            'email': authParameter.email,
            'password': authParameter.password,
          },
        ),
      );
      return AuthModel.fromJson(response);
    } on DioException catch (e) {

      throw ServerException(message: e.response?.data);
    }
  }

  @override
  Future<Unit> signUp({required AuthParameter authParameter}) async {
    try {
      await apiService.post(
        apiServiceInputModel: ApiServiceInputModel(
          url: ApiConstants.signUpUrl,
          body: {
            'userName':authParameter.userName,
            'email': authParameter.email,
            'password': authParameter.password,
            'age': authParameter.age,
            'weight':authParameter.weight,
            'height':authParameter.height,
            'gender': authParameter.gender,
            'isCoach': authParameter.isCoach,
          },
        ),
      );
     
    
      return unit;
    } on DioException catch (e) {
      print(e.toString());
      throw ServerException(message: e.toString());
    }
  }
}
