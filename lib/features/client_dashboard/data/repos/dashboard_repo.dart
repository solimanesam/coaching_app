import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/client_dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/dashboard_base_repo.dart';
import 'package:dartz/dartz.dart';

class DashboardRepo extends DashboardBaseRepo {
  DashboardRepo({required this.dashboardRemoteDataSource});

  final DashboardRemoteDataSource dashboardRemoteDataSource;
  @override
  Future<Either<Failure, List<CoachEntity>>> getCoaches() async {
    try {
      final result = await dashboardRemoteDataSource.getCoaches();
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> editImage(
      {required ImageParameter imageParameter}) async {
    try {
      final result = await dashboardRemoteDataSource.editImage(
          imageParameter: imageParameter);
      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
