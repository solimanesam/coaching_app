import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Padding questionContainer(
    {required BuildContext context,
    required List questions,
    required List answers,
    required int index,
    required int selectedContainer,
    required Function() onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  questions[index],
                  style: TextStyles.semiBold20(context, color: AppColors.black),
                ),
                IconButton(
                    onPressed: () {
                      onTap();
                    },
                    icon: Icon(selectedContainer == index?
                        Icons.keyboard_arrow_up_outlined :Icons.keyboard_arrow_down_sharp,
                      color: AppColors.primaryColor,
                      size: 40,
                    ))
              ],
            ),
            Visibility(
              visible: index == selectedContainer,
              child: Text(
                '       ${answers[index]}',
                style: TextStyles.quarterBold18(
                    context: context, color: AppColors.black),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
