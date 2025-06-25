import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/get_widget_depending_on_reuest_state.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/get_subscriber_files_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/subscriber_file_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriberFilesPage extends StatelessWidget {
  const SubscriberFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetSubscriberFilesController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               Text(
                'Subscriber Files',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
              getWidgetDependingOnReuestState(
                requestStateEnum: controller.getSubscriberFilesState,
                erorrMessage: controller.getSubscriberFilesErrorMessage,
                widgetIncaseSuccess: controller.subscriberFiles.isEmpty
                    ? Center(
                        child: Text(
                          'No subscriber files available.',
                          style: TextStyle(color: AppColors.grey),
                        ),
                      )
                    : Expanded(
                      child: ListView.separated(
                          itemCount: controller.subscriberFiles.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final file = controller.subscriberFiles[index];
                            return SubscriberFileWidget(file: file);
                          },
                        ),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
