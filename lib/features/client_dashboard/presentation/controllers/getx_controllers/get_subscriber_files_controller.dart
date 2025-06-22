import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/base_client_subscription_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetSubscriberFilesController extends GetxController {
  GetSubscriberFilesController(this.baseClientSubscriptionRepo);

  final BaseClientSubscriptionRepo baseClientSubscriptionRepo;

  RequestStateEnum getSubscriberFilesState = RequestStateEnum.loading;
  List<SubscriberFileEntity> subscriberFiles = const [];
  String? getSubscriberFilesErrorMessage;
  
  void getSubscriberFiles() async{
    final Either<Failure, List<SubscriberFileEntity>> result =
        await baseClientSubscriptionRepo.getSubscriberFiles();
    result.fold((l) {
      getSubscriberFilesState = RequestStateEnum.failed;
      getSubscriberFilesErrorMessage = l.message;
    }, (r) {
      getSubscriberFilesState = RequestStateEnum.success;
      subscriberFiles = r;
    });
    update();
  }
}
