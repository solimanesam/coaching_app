import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/getx_controllers/upload_personalized_plan_controller.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/file_upload_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SubscriberPage extends StatelessWidget {
  const SubscriberPage({super.key, required this.subscriber});

  final Subscriber subscriber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<UploadPersonalizedPlanController>(
          builder: (controller) => fileUploadButton(
              context: context,
              onTap: () => controller.uploadPersonalizedPlan(
                  subscriberUserName: subscriber.name),
              isLoading: controller.uploadPersonalizedPlanPlanState ==
                  RequestStateEnum.loading),
        ),
      ),
    );
  }
}
