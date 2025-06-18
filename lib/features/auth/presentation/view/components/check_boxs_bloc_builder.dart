import 'package:coaching_app/core/widgets/custom_check_box.dart';
import 'package:coaching_app/features/auth/presentation/controller/cubit/client_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxsGetBuilder extends StatelessWidget {
  final int count;
  final List<String> checkBoxsNames;

  const CheckBoxsGetBuilder({
    super.key,
    required this.count,
    required this.checkBoxsNames,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientInformationController>();
    return Obx(() {
      return Column(
        children: List.generate(count, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: customCheckBox(
              customCheckBoxInputModel: CustomCheckBoxInputModel(
                context: context,
                checkBoxName: checkBoxsNames[index],
                value: controller.selectedCheckBox.value == index,
                onChanged: () => controller.changeStateOfCheckBox(index),
              ),
            ),
          );
        }),
      );
    });
  }
}
