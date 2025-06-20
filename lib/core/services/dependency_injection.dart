import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/image_picker_service.dart';
import 'package:coaching_app/features/auth/data/data_source/auth_local_data_source/auth_local_data_source.dart';
import 'package:coaching_app/features/auth/data/data_source/remore_data_source/auth_remote_data_source.dart';
import 'package:coaching_app/features/auth/data/repos/auth_repo.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/profile_remore_data_source.dart';
import 'package:coaching_app/features/client_dashboard/data/repos/dashboard_repo.dart';
import 'package:coaching_app/features/client_dashboard/data/repos/profile_repo.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/dashboard_base_repo.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/profile_base_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class DependencyInjection {
  static void setupLocator() {
    ////////////repos
    locator.registerLazySingleton<ProfileBaseRepo>(
        () => ProfileRepo(profileRemoreDataSource: locator()));
    locator.registerLazySingleton<BaseAuthRepo>(() => AuthRepo(
        authRemoteDataSource: locator(), authLocalDataSource: locator()));
    locator.registerLazySingleton<DashboardBaseRepo>(
        () => DashboardRepo(dashboardRemoteDataSource: locator()));
    ////////////datasource
    locator.registerLazySingleton<ProfileRemoreDataSource>(
        () => ProfileRemoreDataSourceImpl(apiService: locator()));
    locator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(apiService: locator()));
    locator.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(cache: locator()));
    locator.registerLazySingleton<DashboardRemoteDataSource>(
        () => DashboardRemoteDataSourceImpl(apiService: locator()));
    ////////////services
    locator.registerLazySingleton<BaseImagePickerService>(
        () => ImagePickerService());
    locator.registerLazySingleton<ApiService>(() => ApiService(locator()));
    locator.registerLazySingleton<BaseCache>(() => CacheImplBySecureStorage());
    locator.registerLazySingleton<Dio>(() => Dio());
  }
}
