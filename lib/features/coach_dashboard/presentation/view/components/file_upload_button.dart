import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controllers/cv_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GestureDetector fileUploadButton(
    {required BuildContext context, required void Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GetBuilder<CvController>(builder: (cvController) {
              return Text(
                cvController.uploadCvState == RequestStateEnum.loading
                    ? 'Loading...'
                    : 'file upload',
                style: TextStyles.semiBold18(
                    context: context, color: AppColors.black),
              );
            }),
            const Spacer(),
            Icon(
              Icons.cloud_upload,
              color: AppColors.primaryColor,
            )
          ],
        ),
      ),
    ),
  );
}
