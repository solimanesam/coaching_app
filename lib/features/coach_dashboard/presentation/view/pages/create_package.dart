import 'package:coaching_app/core/helper_function/empty_validate.dart';
import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/getx_controllers/create_coach_plan_contrller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePackage extends StatelessWidget {
  const CreatePackage({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCoachPlanContrller createCoachPlanContrller =
        Get.find<CreateCoachPlanContrller>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(onPressed: () {
          Get.back();
        }),
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
            Form(
              key: createCoachPlanContrller.formKey,
                child: Column(
              spacing: 40,
              children: [
                customTextField(
                    textFieldInputModel: TextFieldInputModel(
                        context: context,
                        validator: (value) => validateEmpty(value),
                        controller:
                            createCoachPlanContrller.detailsTextFieldController,
                        textHint: 'description')),
                customTextField(
                    textFieldInputModel: TextFieldInputModel(
                        context: context,
                        validator: (value) => validateEmpty(value),
                        controller:
                            createCoachPlanContrller.priceTextFieldController,
                        keyBoardType: TextInputType.number,
                        textHint: 'Package price')),
                customTextField(
                    textFieldInputModel: TextFieldInputModel(
                        context: context,
                        validator: (value) => validateEmpty(value),
                        controller: createCoachPlanContrller
                            .durationInDaysTextFieldController,
                        keyBoardType: TextInputType.number,
                        textHint: 'duration in days')),
              ],
            )),
            Spacer(),
            GetBuilder<CreateCoachPlanContrller>(
              builder: (controller) => customButton(
                  customButtonInputModel: CustomButtonInputModel(
                context: context,
                buttonName:
                    controller.createCoachPlanState == RequestStateEnum.loading
                        ? 'Loading...'
                        : 'Create',
                onPressedFunction: () => controller.createPlan(),
              )),
            )
          ],
        ),
      ),
    );
  }
}
