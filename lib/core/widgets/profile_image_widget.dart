import 'dart:convert';
import 'dart:typed_data';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/Client_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    final ClientDashboardController controller = Get.find<ClientDashboardController>();

    Uint8List? imageBytes;
    if (image != null) {
      try {
        // تنظيف بيانات base64
        final cleanBase64 = image!.contains(',') ? image!.split(',').last : image!;
        imageBytes = base64Decode(cleanBase64);
      } catch (e) {
        imageBytes = null;
      }
    }

    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GetBuilder<ClientDashboardController>(
            builder: (dashController) {
              if (dashController.editImageState == RequestStateEnum.loading) {
                return const SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(strokeWidth: 4),
                );
              }

              return CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.grey,
                child: imageBytes == null
                    ? const Icon(Icons.person, size: 100, color: Colors.white)
                    : ClipOval(
                        child: Image.memory(
                          imageBytes,
                          fit: BoxFit.cover,
                          width: 140,
                          height: 140,
                        ),
                      ),
              );
            },
          ),
          Positioned(
            right: 4.0,
            bottom: 4.0,
            child: Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                onPressed: () => controller.pickImageWithSheet(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
