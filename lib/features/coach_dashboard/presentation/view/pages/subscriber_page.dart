import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/get_widget_depending_on_reuest_state.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/getx_controllers/get_subscribers_by_user.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/getx_controllers/upload_personalized_plan_controller.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/file_upload_button.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/subscriber_widget_by_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Subscriber Details',
              style: TextStyles.semiBold32(context, color: AppColors.black),
            ),
            const SizedBox(height: 32),

            // Subscriber Info
            Text(subscriber.name,
                style: TextStyles.semiBold20(context, color: AppColors.black)),
            Text(subscriber.email,
                style: TextStyles.semiBold20(context, color: AppColors.black)),
            Text('Weight: ${subscriber.weight}',
                style: TextStyles.semiBold20(context, color: AppColors.black)),
            Text('Height: ${subscriber.height}',
                style: TextStyles.semiBold20(context, color: AppColors.black)),

            const SizedBox(height: 32),

            // Upload Button
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

            const SizedBox(height: 16),

            // Files Display (after pressing button)
            GetBuilder<GetSubscriberFilesByUserController>(
              builder: (subController) {
                if (!subController.isPressed ||
                    subController.getSubscriberFilesByUserState == null) {
                  return customButton(
                      customButtonInputModel: CustomButtonInputModel(
                          context: context,
                          buttonName: 'Load Subscriber files',
                          onPressedFunction: () => Get.find<
                                  GetSubscriberFilesByUserController>()
                              .getSubscriberByUserFiles(
                                  userName: subscriber
                                      .name))); // لا تظهر أي شيء قبل الضغط على الزر
                }

                return getWidgetDependingOnReuestState(
                  requestStateEnum:
                      subController.getSubscriberFilesByUserState!,
                  erorrMessage: subController.getSubscriberFilesErrorMessage,
                  widgetIncaseSuccess: subController.subscriberFiles.isEmpty
                      ? Center(
                          child: Text(
                            'No subscriber files available.',
                            style: TextStyle(color: AppColors.grey),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: subController.subscriberFiles.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final file = subController.subscriberFiles[index];
                              return SubscriberFileWidgetByUser(file: file);
                            },
                          ),
                        ),
                );
              },
            ),
            Spacer(),
            if (subscriber.phoneNumber != null)
              customButton(
                customButtonInputModel: CustomButtonInputModel(
                  context: context,
                  buttonName: 'Chat with Coach',
                  onPressedFunction: () async {
                    final phoneNumber = subscriber.phoneNumber!;
                    final Uri whatsappUri = Uri.parse(
                        'https://wa.me/${phoneNumber.replaceAll('+', '')}');
                    if (await canLaunchUrl(whatsappUri)) {
                      await launchUrl(whatsappUri,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $whatsappUri';
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
