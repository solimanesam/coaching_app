import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/plan_entity.dart';
import 'package:flutter/material.dart';

Container requestContainer({
  required BuildContext context,
  required PlanEntity planEntity,
  bool nameCoach = false,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.grey, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          spreadRadius: 1,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Coach Name (if available)
        if (planEntity.coach.userName.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Visibility(
              visible: nameCoach,
              child: Row(
                children: [
                  const Icon(Icons.person, size: 20, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    planEntity.coach.userName,
                    style: TextStyles.semiBold16(context, color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),

        /// Plan Details
        Row(
          children: [
            const Icon(Icons.description, size: 20, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                planEntity.details,
                style: TextStyles.regular14(context, color: AppColors.black),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// Price
        Row(
          children: [
            const Icon(Icons.monetization_on, size: 20, color: Colors.green),
            const SizedBox(width: 8),
            Text(
              '${planEntity.price} USD',
              style: TextStyles.semiBold16(context, color: AppColors.black),
            ),
          ],
        ),
        const SizedBox(height: 8),

        /// Duration
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 20, color: Colors.blue),
            const SizedBox(width: 8),
            Text(
              '${planEntity.durationInDays} Days',
              style: TextStyles.regular14(context, color: AppColors.black),
            ),
          ],
        ),
      ],
    ),
  );
}
