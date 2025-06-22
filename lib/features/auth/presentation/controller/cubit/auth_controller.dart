import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/features/auth/domain/repos/base_auth_repo.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/client_information.dart';
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
        AppSnackBar.show(message: l.message, type: SnackBarType.error);
        print(l.message);
      }, (r) {
        forgetPasswordState = RequestStateEnum.success;
        AppSnackBar.show(
            message: 'If that email is registered you will receive a link',
            type: SnackBarType.success);

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
        AppSnackBar.show(message: l.message, type: SnackBarType.error);
      }, (r) {
        logInState = RequestStateEnum.success;
        AppSnackBar.show(message: 'logged in successfully', type: SnackBarType.success);
        print(r.token);
      });
      update();
    }
  }

  void signUp({required String email, required String password,required String userName}) async {
    signUpState = RequestStateEnum.loading;
    update();
    final result = await baseAuthRepo.signUp(
        authParameter: AuthParameter(
            email: email,
            password: password,
            age: int.parse(tellUsPageControllers[0].text),
            weight: int.parse(tellUsPageControllers[1].text),
            height: int.parse(tellUsPageControllers[2].text),
            userName:userName,
            gender: getGender,
            isCoach: iscoach));
    result.fold((l) {
      
      signUpState = RequestStateEnum.failed;
      AppSnackBar.show(message: l.message, type: SnackBarType.error);
        print("Username: ${signUpUsernameController.text}");
print("Email: ${signUpEmailController.text}");
print("Password: ${signUpPasswordController.text}");
print("Age: ${tellUsPageControllers[0].text}");
print("Weight: ${tellUsPageControllers[1].text}");
print("Height: ${tellUsPageControllers[2].text}");
print("Gender: ${getGender}");
print("Is Coach: ${iscoach}");
    }, (r) {
      signUpState = RequestStateEnum.success;
      AppSnackBar.show(
          message: 'Your account has been created successfully',
          type: SnackBarType.success);
      Get.to(() => LogInPage());
    });
    update();
  }

  ///////////////////////////varaibles for radiobutton (user type)
  String userType = 'client';
  String get getUserType => userType;

  void changeUserType(String type) {
    userType = type;
    update();
  }

  bool get iscoach => userType == 'coach';
  ///////////////////////////////////////////////////
  final infocontroller = Get.find<ClientInformationController>();
  String get getGender =>
      infocontroller.selectedCheckBox.value == 0 ? 'male' : 'female';
}
