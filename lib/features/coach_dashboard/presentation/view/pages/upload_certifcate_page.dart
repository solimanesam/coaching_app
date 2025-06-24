import 'package:coaching_app/core/helper_function/launch_cv.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/get_widget_depending_on_reuest_state.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/bottom_sheet_widget.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controllers/cv_controller.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/file_upload_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadCertifcatePage extends StatelessWidget {
  const UploadCertifcatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(
          onPressed: () => Get.back(),
        ),
      ),
      body: GetBuilder<CvController>(
        builder: (controller) {
          return getWidgetDependingOnReuestState(
            requestStateEnum: controller.getCvState,
            erorrMessage: "Failed to load CV data",
            widgetIncaseSuccess: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Upload Certificate',
                    style: TextStyles.semiBold32(context, color: AppColors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Upload your certificates to be reviewed and registered in your file.',
                    textAlign: TextAlign.center,
                    style: TextStyles.regular16_120(context, color: AppColors.black),
                  ),
                  const Spacer(),

                  // ✅ لو مفيش CV
                  if (controller.cvEntity == null)
                    fileUploadButton(
                      context: context,
                      onTap: () => controller.pickAndUploadCV(),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        customButton(
                          customButtonInputModel: CustomButtonInputModel(
                            context: context,
                            buttonName: 'View CV',
                            onPressedFunction: () {
                              launchLink(controller.cvEntity!.openCv);
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        customButton(
                          customButtonInputModel: CustomButtonInputModel(
                            context: context,
                            buttonName: 'Download CV',
                            onPressedFunction: () {
                              launchLink(controller.cvEntity!.downloadCv);
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        GetBuilder<CvController>(builder: (cvController) {
                          return customButton(
                            customButtonInputModel: CustomButtonInputModel(
                              context: context,
                              buttonName: cvController.deleteCvState == RequestStateEnum.loading
                                  ? 'Deleting...'
                                  : 'Delete CV',
                              onPressedFunction: () {
                                appBottomSheet(
                                  context: context,
                                  text1: 'Delete CV',
                                  text2: "Are you sure you want to delete your CV?",
                                  onPressed: () {
                                    cvController.deleteCv();
                                    Get.back();
                                  },
                                );
                              },
                            ),
                          );
                        }),
                      ],
                    ),

                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
