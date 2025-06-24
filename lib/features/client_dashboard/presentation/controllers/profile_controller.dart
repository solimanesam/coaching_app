import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/profile_base_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController({required this.profileBaseRepo});

  final ProfileBaseRepo profileBaseRepo;

  ////////////////////////////variables
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> editProfileFormkey = GlobalKey<FormState>();

  RequestStateEnum? editProfileState;
  String? editProfileErrorMess;
  //////////////////////////////////////
  ProfileEntity? profileInfo;
  RequestStateEnum getProfileState = RequestStateEnum.loading;
  String? getProfileErrorMess;
//////////////////////////////////////
  editProfile() async {
    if (editProfileFormkey.currentState!.validate()) {
      editProfileState = RequestStateEnum.loading;
      update();
      final result = await profileBaseRepo.editProfile(
          profileParameters: ProfileParameters(
              userName: userNameController.text,
              email: emailController.text,
              weight: int.parse(weightController.text),
              height: int.parse(heightController.text)));
      result.fold((l) {
        editProfileErrorMess = l.message;
        editProfileState = RequestStateEnum.failed;
        AppSnackBar.show(message: l.message, type: SnackBarType.error);
        update();
      }, (_) {
        Get.back();
        editProfileState = RequestStateEnum.success;
        AppSnackBar.show(
            message: 'updated successfully', type: SnackBarType.success);
        update();

        getProfile();
        emailController.clear();
        userNameController.clear();
        heightController.clear();
        weightController.clear();
      });
    }
  }

  ////////////////////////////////////////
  getProfile() async {
    final result = await profileBaseRepo.getProfile();
    result.fold((l) {
      getProfileErrorMess = l.message;
      getProfileState = RequestStateEnum.failed;
      update();
    }, (r) {
      profileInfo = r;
      getProfileState = RequestStateEnum.success;
      update();
    });
  }

  @override
  void onInit() {
    getProfile();
    print("init");
    super.onInit();
  }
}
