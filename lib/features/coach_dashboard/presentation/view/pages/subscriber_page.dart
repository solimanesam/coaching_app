import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/getx_controllers/upload_personalized_plan_controller.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/file_upload_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriberPage extends StatelessWidget {
  const SubscriberPage({super.key, required this.subscriber});

  final Subscriber subscriber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(onPressed: () => Get.back()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Subscriber Details',
                style: TextStyles.semiBold32(context, color: AppColors.black)),
                SizedBox(height: 32),
            // Subscriber Info
            Text(subscriber.name,
                style: TextStyles.semiBold20(context, color: AppColors.black)),
            Text(subscriber.email,
                style: TextStyles.semiBold20(context, color: AppColors.black)),
            Text('ًWeight: ${subscriber.weight}',
                style: TextStyles.semiBold20(context, color: AppColors.black)),
            Text('Height: ${subscriber.height}',
                style: TextStyles.semiBold20(context, color: AppColors.black)),
            // Add more fields like age, height, weight, etc., if available
            SizedBox(height: 32),

            // Upload Plan Button
            Center(
              child: GetBuilder<UploadPersonalizedPlanController>(
                builder: (controller) => fileUploadButton(
                  context: context,
                  onTap: () => controller.uploadPersonalizedPlan(
                    subscriberUserName: subscriber.name,
                  ),
                  isLoading: controller.uploadPersonalizedPlanPlanState ==
                      RequestStateEnum.loading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
