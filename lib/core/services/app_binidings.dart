import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/client_information.dart';
import 'package:get/get.dart';

class AppBinidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(baseAuthRepo: locator()), fenix: true);
    Get.lazyPut(() => ClientInformationController(), fenix: true);
  }
}
