import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

GestureDetector fileUploadButton(
    {required BuildContext context,
    required void Function() onTap,
    required bool isLoading}) {
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
            Text(
              'file upload',
              style: TextStyles.semiBold18(
                  context: context, color: AppColors.black),
            ),
            Visibility(
                visible: isLoading,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.primaryColor,
                )),
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
