import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/dashboard_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetCoachesController extends GetxController {
  GetCoachesController(this.dashboardBaseRepo);

  final DashboardBaseRepo dashboardBaseRepo;

  RequestStateEnum getCoachesState = RequestStateEnum.loading;
  List<CoachEntity> coaches = const [];
  String? getCoachesErrorMessage;

//search
  List<CoachEntity> searchList = const [];

  void getCoaches() async {
    final Either<Failure, List<CoachEntity>> result =
        await dashboardBaseRepo.getCoaches();
    result.fold((l) {
      getCoachesState = RequestStateEnum.failed;
      getCoachesErrorMessage = l.message;
      print(l.message);
    }, (r) {
      getCoachesState = RequestStateEnum.success;
      coaches = r;
      print(r);
    });
    update();
  }

  void search({required String string}) {
    searchList = coaches
        .where((element) => element.name.toString().startsWith(string))
        .toList();
    if (string == '') searchList.clear();
    update();
  }

  @override
  void onInit() {
    getCoaches();
    super.onInit();
  }
}
