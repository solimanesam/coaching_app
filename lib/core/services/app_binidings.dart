import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/client_information.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/Client_bottom_nav_controller.dart.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/Client_dashboard_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/get_coaches_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/get_subscriber_files_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/subscribe_controller.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/getx_controllers/create_coach_plan_contrller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/profile_controller.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controllers/cv_controller.dart';
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
    Get.lazyPut(() => CreateCoachPlanContrller(locator()), fenix: true);
    Get.lazyPut(() => SubscribeController(locator()), fenix: true);
    Get.lazyPut(() => GetSubscriberFilesController(locator()), fenix: true);
    Get.lazyPut(() => ProfileController(profileBaseRepo: locator()),
        fenix: true);
    Get.lazyPut(() => GetCoachesController(locator()), fenix: true);
    Get.lazyPut(
        () => CvController(cvBaseRepo: locator(), filePicker: locator()),
        fenix: true);
  }
}
