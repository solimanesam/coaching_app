import 'dart:convert';
import 'dart:typed_data';
import 'package:coaching_app/core/theme/app_colors.dart';
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
    final ClientDashboardController controller =
        Get.find<ClientDashboardController>();

    Uint8List? imageBytes;
    if (image != null) {
      try {
        // لو الصورة جاية بصيغة data:image/jpeg;base64,xxxxx
        final cleanBase64 = image!.contains(',') ? image!.split(',').last : image!;
        imageBytes = base64Decode(cleanBase64);
      } catch (e) {
        // لو حصل خطأ في فك الشيفرة
        imageBytes = null;
      }
    }

    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: AppColors.grey,
          child: imageBytes == null
              ? const Icon(Icons.person, size: 50)
              : ClipOval(
                  child: Image.memory(
                    imageBytes,
                    fit: BoxFit.cover,
                    width: 140,
                    height: 140,
                  ),
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
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.edit, size: 18, color: Colors.white),
              onPressed: () => controller.pickImageWithSheet(),
            ),
          ),
        ),
      ],
    );
  }
}
