import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/chat/presentation/controllers/chat_controller.dart';
import 'package:coaching_app/features/chat/presentation/pages/chat_page.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscription_plan_by_coach_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/profile_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/custom_row_for_cap_details.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/subscriber_file_widget.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/packages_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CapDetails extends StatelessWidget {
  const CapDetails({super.key, required this.coachEntity});

  final CoachEntity coachEntity;

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_circle_left,
                    color: AppColors.black,
                    size: 30,
                  ),
                ),
              ),

              // Profile Image
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: context.widthResponsive * 0.4,
                  width: context.widthResponsive * 0.4,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(context.widthResponsive * 0.25),
                    image: coachEntity.profileImageUrl != null
                        ? DecorationImage(
                            image: NetworkImage(coachEntity.profileImageUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: AppColors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Info Rows
              customRowForCapDetails(
                context: context,
                label: 'Name',
                value: coachEntity.userName,
              ),
              const SizedBox(height: 10),
              customRowForCapDetails(
                context: context,
                label: 'Email',
                value: coachEntity.email,
              ),
              customRowForCapDetails(
                context: context,
                label: 'Gender',
                value: coachEntity.gender,
              ),
              customRowForCapDetails(
                context: context,
                label: 'Age',
                value: coachEntity.age.toString(),
              ),
              customRowForCapDetails(
                context: context,
                label: 'Height',
                value: '${coachEntity.height} cm',
              ),
              customRowForCapDetails(
                context: context,
                label: 'Weight',
                value: '${coachEntity.weight} kg',
              ),

              const SizedBox(height: 30),

              // CV Buttons
// CV Buttons
              if (coachEntity.cvViewUrl != null &&
                  coachEntity.cvDownloadUrl != null)
                FileLinkWidget(
                  viewLink: coachEntity.cvViewUrl!,
                  downloadLink: coachEntity.cvDownloadUrl!,
                )
              else
                Text(
                  'No CV available',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
              const SizedBox(height: 30),

              // Packages Button
              customButton(
                customButtonInputModel: CustomButtonInputModel(
                  context: context,
                  buttonName: 'Packages',
                  onPressedFunction: () => Get.to(
                    PackagesPage(
                      subscriptionPlanByCoachInputModel:
                          SubscriptionPlanByCoachInputModel(
                        coashName: coachEntity.userName,
                      ),
                    ),
                  ),
                ),
              ),
              customButton(
  customButtonInputModel: CustomButtonInputModel(
    context: context,
    buttonName: 'Chat with Coach',
    onPressedFunction: () {
      final chatController = Get.find<ChatController>();
      chatController.initConnection(
        currentUser:'soliman' ,
        receiverUser: coachEntity.userName,
      );

      Get.to(() => ChatPage(
        currentUsername:'soliman',
        receiverUsername: coachEntity.userName,
        chatController: chatController,
      ));
    },
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
