import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController({required this.baseAuthRepo});

  final BaseAuthRepo baseAuthRepo;
  RxBool isSecureController = true.obs;
////////////////////////////////////
  isSecureActive() {
    isSecureController.value = !isSecureController.value;
  }

  ///////////////////////////////////////////////
  final TextEditingController forgetPassEmailController =
      TextEditingController();
  final GlobalKey<FormState> forgetPassFormkey = GlobalKey<FormState>();
  RequestStateEnum? forgetPasswordState;
  String? forgetPasswordMessage;
  ////////////////////////////////////////////////
  final TextEditingController logInEmailController = TextEditingController();
  final TextEditingController logInPasswordController = TextEditingController();
  final GlobalKey<FormState> logInFormkey = GlobalKey<FormState>();
  RequestStateEnum? logInState;
  String? logInMessage;
///////////////////////////////////////////////
  final List<TextEditingController> tellUsPageControllers =
      List.generate(3, (_) => TextEditingController());

  final GlobalKey<FormState> tellUsPageFormkey = GlobalKey<FormState>();
////////////////////////////////

  final TextEditingController signUpUsernameController =
      TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpConfirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> signUpFormkey = GlobalKey<FormState>();
  RequestStateEnum? signUpState;

  /////////////////////////////////////////////
  void forgetPassword() async {
    if (forgetPassFormkey.currentState!.validate()) {
      forgetPasswordState = RequestStateEnum.loading;
  update();
      final result = await baseAuthRepo.forgetPassword(
          authParameter: AuthParameter(email: forgetPassEmailController.text));
      result.fold((l) {
        forgetPasswordState = RequestStateEnum.failed;
        forgetPasswordMessage = l.message;
        Get.snackbar('error', l.message);
        print(l.message);
      }, (r) {
        forgetPasswordState = RequestStateEnum.success;
        Get.snackbar(
            '', 'If that email is registered you will receive a link.');

        print('success');
      });
        update();

    }
  }

  void logIn() async {
    if (logInFormkey.currentState!.validate()) {
          logInState = RequestStateEnum.loading;
update();
      final result = await baseAuthRepo.logIn(
          authParameter: AuthParameter(
              email: logInEmailController.text,
              password: logInPasswordController.text));
      result.fold((l) {
        logInState = RequestStateEnum.failed;
        logInMessage = l.message;
        Get.snackbar('error', l.message);
      }, (r) {
        logInState = RequestStateEnum.success;
        final token = r;
        print(token);
      });
        update();

    }
  }

  void signUp() async {
    if (signUpFormkey.currentState!.validate()) {
      signUpState = RequestStateEnum.loading;
      update();
      final result = await baseAuthRepo.signUp(
          authParameter: AuthParameter(
              email: signUpEmailController.text,
              password: signUpPasswordController.text,
              age: int.parse(tellUsPageControllers[0].text),
              weight: int.parse(tellUsPageControllers[1].text),
              height: int.parse(tellUsPageControllers[2].text),
              userName: signUpUsernameController.text,
              gender: 'male',
              isCoach: iscoach));
      result.fold((l) {
        signUpState = RequestStateEnum.failed;
        Get.snackbar('error', l.message);
      }, (r) {
        signUpState = RequestStateEnum.success;
        Get.snackbar('Success', 'Your account has been created successfully');
        Get.to(() => LogInPage());
      });
        update();

    }
  }

  ///////////////////////////varaibles for radiobutton (user type)
  String userType = 'client';
  String get getUserType => userType;

  void changeUserType(String type) {
    userType = type;
    update();
  }

  bool get iscoach => userType == 'coach';
}
