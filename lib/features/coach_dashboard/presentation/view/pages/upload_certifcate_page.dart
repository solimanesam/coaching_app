import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controllers/cv_controller.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/file_upload_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadCertifcatePage extends StatelessWidget {
  const UploadCertifcatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CvController cvController = Get.find<CvController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              'Upload Certifcate',
              style: TextStyles.semiBold32(context, color: AppColors.black),
            ),
            Text(
              'Upload your certificates to be reviewed and registered in your file.',
              textAlign: TextAlign.center,
              style: TextStyles.regular16_120(
                context,
                color: AppColors.black,
              ),
            ),
            Spacer(),
            fileUploadButton(
              context: context,
              onTap: () {
                cvController.pickAndUploadCV();
              },
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
