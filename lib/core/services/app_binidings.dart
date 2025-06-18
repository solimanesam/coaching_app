import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/client_information.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/Client_bottom_nav_controller.dart.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/Client_dashboard_controller.dart';
import 'package:coaching_app/features/payment_integration/presentation/controller/stripe_controller.dart';
import 'package:get/get.dart';

class AppBinidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(baseAuthRepo: locator()), fenix: true);
    Get.lazyPut(() => ClientInformationController(), fenix: true);
    Get.lazyPut(() => ClientBottomNavController(), fenix: true);
    Get.lazyPut(
        () => ClientDashboardController(
            dashboardBaseRepo: locator(), imagePickerService: locator()),
        fenix: true);
    Get.lazyPut(() => StripeController(locator()), fenix: true);
  }
}
