import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/Client_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillYourProfilePage extends StatelessWidget {
  const FillYourProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30.0,
      children: [
        ProfileImage(),
        ...List.generate(
            3,
            (index) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.widthResponsive * .10),
                  child: customTextField(
                      textFieldInputModel: TextFieldInputModel(
                    context: context,
                    controller: TextEditingController(),
                    textHint: ViewConstants
                        .fillYourProfilePageTextFieldsHintTexts[index],
                  )),
                )),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientDashboardController>();
    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: const Color.fromARGB(255, 201, 195, 195),
          child: Icon(
            Icons.person,
            color: AppColors.white,
            size: 70,
          ),
        ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: GestureDetector(
            onTap: () => controller.pickImageWithSheet(),
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Center(
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 18, // تحكم في الحجم المناسب
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
