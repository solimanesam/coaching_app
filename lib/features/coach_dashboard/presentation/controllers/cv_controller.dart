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
  RequestStateEnum? uploadCvState;
  RequestStateEnum? deleteCvState;

  Future<void> pickAndUploadCV() async {
  final filePath =
      await filePicker.pickFile(allowedExtensions: ['pdf', 'doc', 'docx']);

  if (filePath != null) {
    uploadCvState = RequestStateEnum.loading; // 🔁 قبل الرفع
    update();

    final result = await cvBaseRepo.uploadCv(
      cvParameters: CvParameters(filePath: filePath),
    );

    result.fold((l) {
      uploadCvState = RequestStateEnum.failed;
      AppSnackBar.show(message: 'failed to upload', type: SnackBarType.error);
    }, (r) async {
      uploadCvState = RequestStateEnum.success;
      AppSnackBar.show(
          message: 'Upload successfully', type: SnackBarType.success);
      await getCv(); // ✅ لتحديث الواجهة
    });

    update();
  } else {
    AppSnackBar.show(message: 'No file selected', type: SnackBarType.warning);
  }
}


  Future<void> getCv() async {
    final result = await cvBaseRepo.getCv();
    result.fold(
      (l) {
        getCvState = RequestStateEnum.failed;
        AppSnackBar.show(message: 'failed to get CV', type: SnackBarType.error);
      },
      (r) {
        // ✅ لو null، اعتبره نجاح ولكن بدون CV
        getCvState = RequestStateEnum.success;
        cvEntity = r; // ممكن تكون null ومفيش مشكلة
      },
    );
    update();
  }

  deleteCv() async {
    deleteCvState = RequestStateEnum.loading;
    update();
    final result = await cvBaseRepo.deleteCv();
    result.fold((l) {
      deleteCvState = RequestStateEnum.failed;
      AppSnackBar.show(
          message: 'failed to delete Cv', type: SnackBarType.error);
    }, (r) async {
      deleteCvState = RequestStateEnum.success;
      AppSnackBar.show(
          message: 'Cv deleted successfully', type: SnackBarType.success);
      await getCv();
    });
    update();
  }

  @override
  void onInit() async {
    await getCv();
    super.onInit();
  }
}
