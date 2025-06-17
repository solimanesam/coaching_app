import 'package:coaching_app/features/client_dashboard/presentation/controllers/Client_bottom_nav_controller.dart.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/question_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqDetails extends StatelessWidget {
  const FaqDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientBottomNavController>(
      builder: (controller) {
        return Column(
          children: [
            const SizedBox(height: 30),
            ...List.generate(
              controller.questions.length,
              (index) {
                return questionContainer(
                  answers: controller.answers,
                  index: index,
                  questions: controller.questions,
                  context: context,
                  selectedContainer: controller.selectedContainer,
                  onTap: () => controller.pressedButton(index),
                );
              },
            )
          ],
        );
      },
    );
  }
}
