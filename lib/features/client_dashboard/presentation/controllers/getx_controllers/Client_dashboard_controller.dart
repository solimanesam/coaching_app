import 'dart:io';
import 'package:coaching_app/core/widgets/custom_bottom_sheet.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/core/services/image_picker_service.dart';
import 'package:coaching_app/features/client_dashboard/domain/repos/dashboard_base_repo.dart';

class ClientDashboardController extends GetxController {
  ClientDashboardController({
    required this.dashboardBaseRepo,
    required this.imagePickerService,
  });

  final DashboardBaseRepo dashboardBaseRepo;
  final BaseImagePickerService imagePickerService;

  RequestStateEnum? editImageState;
  File? selectedImage;

  /// Show bottom sheet to choose image source (camera or gallery)
  Future<void> pickImageWithSheet() async {
    await showImageSourceBottomSheet(
      onSourceSelected: (ImageSourceType sourceType) async {
        await _handleImagePick(sourceType);
      },
    );
  }

  /// Internal function to handle image selection and upload
  Future<void> _handleImagePick(ImageSourceType sourceType) async {
    editImageState = RequestStateEnum.loading;
    update();

    try {
      selectedImage =
          await imagePickerService.pickImage(sourceType: sourceType);

      if (selectedImage == null) {
        editImageState = RequestStateEnum.failed;
        AppSnackBar.show(
          message: "No image selected",
          type: SnackBarType.warning,
        );
        update();
        return;
      }

      final result = await dashboardBaseRepo.editImage(
        imageParameter: ImageParameter(imageFile: selectedImage!.path),
      );

      result.fold(
        (failure) {
          editImageState = RequestStateEnum.failed;
          AppSnackBar.show(message: failure.message, type: SnackBarType.error);
        },
        (_) {
          editImageState = RequestStateEnum.success;
          AppSnackBar.show(
            message: "Image has been edited successfully",
            type: SnackBarType.success,
          );
          final ProfileController profileController =
              Get.find<ProfileController>();
          profileController.getProfile();
          update();
        },
      );
    } catch (e) {
      editImageState = RequestStateEnum.failed;
      AppSnackBar.show(
        message: "Unexpected error: $e",
        type: SnackBarType.error,
      );
    } finally {
      update();
    }
  }
}
