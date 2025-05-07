import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreatePackage extends StatelessWidget {
  const CreatePackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 50),
        child: Column(
          spacing: 40,
          children: [
            Text(
              'Create Package',
              style: TextStyles.semiBold32(context, color: AppColors.black),
            ),
            SizedBox(
              height: 30,
            ),
            customTextField(
                textFieldInputModel: TextFieldInputModel(
                    context: context,
                    controller: TextEditingController(),
                    textHint: 'package Name')),
            customTextField(
                textFieldInputModel: TextFieldInputModel(
                    context: context,
                    controller: TextEditingController(),
                    textHint: 'description')),
            customTextField(
                textFieldInputModel: TextFieldInputModel(
                    context: context,
                    controller: TextEditingController(),
                    textHint: 'Package price')),
            Spacer(),
            customButton(
                customButtonInputModel: CustomButtonInputModel(
              context: context,
              buttonName: 'Create',
              onPressedFunction: () {},
            ))
          ],
        ),
      ),
    );
  }
}
