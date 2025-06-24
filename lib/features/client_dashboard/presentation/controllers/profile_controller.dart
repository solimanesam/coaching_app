import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/profile_entity.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/profile_base_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController({required this.profileBaseRepo});

  final ProfileBaseRepo profileBaseRepo;

  ////////////////////////////variables
  TextEditingController userNameController = TextEditingController();
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
          profileEntity: ProfileEntity(
            image: 'dmdndn',
              userName: userNameController.text,
              email: userNameController.text,
              // weight: userNameController.text,
              // height: userNameController.text
              ));
      result.fold((l) {
        editProfileErrorMess = l.message;
        editProfileState = RequestStateEnum.failed;
        update();
      }, (_) {
        editProfileState = RequestStateEnum.success;
        update();
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
