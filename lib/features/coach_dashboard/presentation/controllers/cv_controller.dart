import 'package:coaching_app/core/services/file_picker_service.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/features/coach_dashboard/domain/entities/cv_entity.dart';
import 'package:coaching_app/features/coach_dashboard/domain/repos/cv_base_repo.dart';
import 'package:get/get.dart';

class CvController extends GetxController {
  final CvBaseRepo cvBaseRepo;
  final BaseFilePicker filePicker;

  CvController({
    required this.cvBaseRepo,
    required this.filePicker,
  });

  RequestStateEnum getCvState = RequestStateEnum.loading;
  CvEntity? cvEntity;

  Future<void> pickAndUploadCV() async {
    final filePath =
        await filePicker.pickFile(allowedExtensions: ['pdf', 'doc', 'docx']);

    if (filePath != null) {
      final result = await cvBaseRepo.uploadCv(
          cvParameters: CvParameters(filePath: filePath));
      result.fold((l) {
        AppSnackBar.show(message: 'failed to upload', type: SnackBarType.error);
      }, (r) {
        AppSnackBar.show(
            message: 'Upload successfully', type: SnackBarType.success);
      });
    } else {
      AppSnackBar.show(message: 'No file selected', type: SnackBarType.warning);
    }
  }

  getCv() async {
    final result = await cvBaseRepo.getCv();
    result.fold((l) {
      getCvState = RequestStateEnum.failed;
      AppSnackBar.show(message: 'failed to getcv', type: SnackBarType.error);
    }, (r) {
      getCvState = RequestStateEnum.success;
      cvEntity = r;
    });
    update();
  }
}
