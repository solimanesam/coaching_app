import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';
import 'package:flutter/material.dart';

Container requestContainer(
    {required BuildContext context, required PlanEntity planEntity}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.grey, width: 1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            planEntity.details,
            style: TextStyles.semiBold20(context, color: AppColors.black),
          ),
          Text(
            planEntity.price.toString(),
            style: TextStyles.semiBold20(context, color: AppColors.black),
          ),
          Text(
            planEntity.durationInDays.toString(),
            style: TextStyles.semiBold20(context, color: AppColors.black),
          ),
        ]),
      ],
    ),
  );
}
