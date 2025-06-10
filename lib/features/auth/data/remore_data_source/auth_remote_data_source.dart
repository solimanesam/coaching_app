import 'package:coaching_app/core/constants/api_constants.dart';
import 'package:coaching_app/core/errors/exceptions.dart';
import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> signUp({required AuthParameter authParameter});
  Future<String> logIn({required AuthParameter authParameter});
  Future<Unit> forgetPassword({required AuthParameter authParameter});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Unit> forgetPassword({required AuthParameter authParameter}) async {
    try {
      final response = await apiService.post(ApiConstants.forgetPasswordUrl,
          data: {'email': authParameter.email});
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return unit;
      } else {
        print('repo error ');

        final responseText = response.data['message'];
        throw ServerException(message: responseText);
      }
    } catch (e) {
      print(' $e');
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> logIn({required AuthParameter authParameter}) async {
    try {
      final response = await apiService.post(ApiConstants.logInUrl, data: {
        'email': authParameter.email,
        'password': authParameter.password
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        final responseText = response.data;
        throw ServerException(message: responseText);
      }
    } catch (e) {
      print(e.toString());
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Unit> signUp({required AuthParameter authParameter}) async {
    try {
      final response = await apiService.post(ApiConstants.signUpUrl, data: {
        "userName": authParameter.userName,
        "email": authParameter.email,
        "password": authParameter.password,
        "age": authParameter.age,
        "weight": authParameter.weight,
        "height": authParameter.height,
        "gender": authParameter.gender,
        "isCoach": authParameter.isCoach,
      });
      if (response.statusCode == 200) {
        return unit;
      } else {
        final responseText = response.data;

        throw ServerException(message: responseText);
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
