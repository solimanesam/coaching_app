import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/features/auth/data/remore_data_source/auth_remote_data_source.dart';
import 'package:coaching_app/features/auth/data/repos/auth_repo.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class DependencyInjection {
  static void setupLocator() {
    ////////////repos
    locator.registerLazySingleton<BaseAuthRepo>(
        () => AuthRepo(authRemoteDataSource: locator()));
    ////////////datasource
    locator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(apiService: locator()));
    ////////////services
    locator.registerLazySingleton<ApiService>(() => ApiService());
  }
}
