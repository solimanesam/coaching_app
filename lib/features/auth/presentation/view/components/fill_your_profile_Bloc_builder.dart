import 'package:coaching_app/core/constants/view_constants.dart';
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class FillYourProfileBlocBuilder extends StatelessWidget {
  const FillYourProfileBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 30.0,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: AppColors.grey,
              child: Icon(
                Icons.person,
                color: AppColors.white,
                size: 70,
              ),
            ),
            Positioned(
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Icon(Icons.image),
                )),
    
          ],
        ),
        ...List.generate(
        3,
        (index) => Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.widthResponsive * .10),
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
