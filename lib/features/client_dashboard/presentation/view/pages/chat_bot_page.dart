import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/custom_text_field.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/chat_bot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotWidget extends StatelessWidget {
  const ChatBotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatBotController>(
      builder: (controller) {
        return Column(
          children: [
            // الرسائل
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller
                      .messages[controller.messages.length - 1 - index];
                  return Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message.isUser
                            ? AppColors.primaryColor
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(message.message,
                          style: TextStyles.regular16_120(
                            context,
                            color:
                                message.isUser ? Colors.white : Colors.black87,
                          )),
                    ),
                  );
                },
              ),
            ),

            // إدخال وإرسال
            Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: customTextField(
                          textFieldInputModel: TextFieldInputModel(
                              context: context,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a question';
                                }
                                return null;
                              },
                              controller: controller.messageController,
                              textHint: 'Write Your Question')),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () => controller.sendPrompet(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
