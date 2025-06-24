import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_app_bar.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_controller.dart';
import 'package:coaching_app/features/auth/presentation/view/components/check_boxs_bloc_builder.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/client_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseYourGenderPage extends StatelessWidget {
  const ChooseYourGenderPage({super.key, required this.name, required this.email, required this.password, required this.iscoach});
  final String name;
  final String email;
 final String password;
 final bool iscoach;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientInformationController>();
        final authController = Get.find<AuthController>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customAppBar(
            customAppBarInputModel: CustomAppBarInputModel(
              appBarTitle: ViewConstants.chooseYourGenderPageAppBarTitle,
              context: context,
              iconButtonOnPressedFunction: () => Get.back(),
            ),
          ),
          CheckBoxsGetBuilder(
            count: 2,
            checkBoxsNames: ViewConstants.chooseYourGenderPageCheckBoxSNames,
          ),
          GetBuilder<AuthController>(
            builder: (cont) {
              return customButton(
                customButtonInputModel: CustomButtonInputModel(
                  context: context,
                  buttonName:cont.signUpState == RequestStateEnum.loading ? "Loading..." : ViewConstants.doneButtonText,
                  onPressedFunction: () {
                    if (controller.validateGenderSelection()) {
                      authController.signUp(email:email, password: password, userName: name,iscoachh: iscoach);
                    } else {
                      Get.snackbar(
                        "Warning",
                        "Please select a gender before continuing",
                        backgroundColor: Colors.red.shade400,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(15),
                        duration: const Duration(seconds: 2),
                      );
                    }
                  },
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
