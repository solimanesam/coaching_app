import 'package:coaching_app/core/services/api_service.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/file_picker_service.dart';
import 'package:coaching_app/core/services/image_picker_service.dart';
import 'package:coaching_app/features/auth/data/data_source/auth_local_data_source/auth_local_data_source.dart';
import 'package:coaching_app/features/auth/data/data_source/remore_data_source/auth_remote_data_source.dart';
import 'package:coaching_app/features/auth/data/repos/auth_repo.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/remote_data_source/chat_bot_remote_data_source.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/remote_data_source/client_subscription_remote_data_source.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/remote_data_source/dashboard_remote_data_source.dart';
import 'package:coaching_app/features/client_dashboard/data/repos/chat_bot_repo.dart';
import 'package:coaching_app/features/client_dashboard/data/repos/client_subscription_repo.dart';
import 'package:coaching_app/features/client_dashboard/data/repos/dashboard_repo.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_chat_bot_repo.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_client_subscription_repo.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/dashboard_base_repo.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/cubit/get_coach_plan_by_coach_cubit.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/cubit/get_subscription_plans_cubit.dart';
import 'package:coaching_app/features/coach_dashboard/data/data_sources/remote_data_source/coach_subscription_remote_data_source.dart';
import 'package:coaching_app/features/coach_dashboard/data/repos/coach_subscription_repo.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/repos/base_coach_subscription_repo.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/cubit/get_subscribers_cubit.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/profile_remore_data_source.dart';
import 'package:coaching_app/features/client_dashboard/data/repos/profile_repo.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/profile_base_repo.dart';
import 'package:coaching_app/features/coach_dashboard/data/data_sources/remote_data_source/cv_remote_data_source.dart';
import 'package:coaching_app/features/coach_dashboard/data/repos/cv_repo.dart';
import 'package:coaching_app/features/coach_dashboard/domain/repos/cv_base_repo.dart';
import 'package:coaching_app/features/payment_integration/presentation/controller/stripe_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class DependencyInjection {
  static void setupLocator() {
    ////////////controllers
    locator.registerFactory(() => GetSubscriptionPlansCubit(locator()));
    locator.registerFactory(() => GetSubscribersCubit(locator()));
    locator.registerFactory(() => GetCoachPlanByCoachCubit(locator()));
    locator.registerLazySingleton(() => StripeController(locator()));
    ////////////repos

    locator.registerLazySingleton<BaseChatBotRepo>(
        () => ChatBotRepo(chatBotRemoteDataSource: locator()));
    locator.registerLazySingleton<CvBaseRepo>(
        () => CvRepo(cvRemoteDataSource: locator()));
    locator.registerLazySingleton<ProfileBaseRepo>(
        () => ProfileRepo(profileRemoreDataSource: locator()));
    locator.registerLazySingleton<BaseAuthRepo>(() => AuthRepo(
        authRemoteDataSource: locator(), authLocalDataSource: locator()));
    locator.registerLazySingleton<DashboardBaseRepo>(
        () => DashboardRepo(dashboardRemoteDataSource: locator()));
    locator.registerLazySingleton<BaseCoachSubscriptionRepo>(() =>
        CoachSubscriptionRepo(
            baseCoachSubscriptionRemoteDataSource: locator()));
    locator.registerLazySingleton<BaseClientSubscriptionRepo>(() =>
        ClientSubscriptionRepo(
            baseClientSubscriptionRemoteDataSource: locator()));
    ////////////datasource
    locator.registerLazySingleton<BaseChatBotRemoteDataSource>(
        () => ChatBotRemoteDataSource(apiService: locator()));
    locator.registerLazySingleton<CvRemoteDataSource>(
        () => CvRemoteDataSourceImpl(apiService: locator()));
    locator.registerLazySingleton<ProfileRemoreDataSource>(
        () => ProfileRemoreDataSourceImpl(apiService: locator()));
    locator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(apiService: locator()));
    locator.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(cache: locator()));
    locator.registerLazySingleton<DashboardRemoteDataSource>(
        () => DashboardRemoteDataSourceImpl(apiService: locator()));
    locator.registerLazySingleton<BaseCoachSubscriptionRemoteDataSource>(
        () => CoachSubscriptionRemoteDataSource(apiService: locator()));
    locator.registerLazySingleton<BaseClientSubscriptionRemoteDataSource>(
        () => ClientSubscriptionRemoteDataSource(apiService: locator()));
    ////////////services
    locator.registerLazySingleton<BaseFilePicker>(() => FilePickerImpl());
    locator.registerLazySingleton<BaseImagePickerService>(
        () => ImagePickerService());
    locator.registerLazySingleton<ApiService>(() => ApiService(locator()));
    locator.registerLazySingleton<BaseCache>(() => CacheImplBySecureStorage());
    locator.registerLazySingleton<Dio>(() => Dio());
  }
}
