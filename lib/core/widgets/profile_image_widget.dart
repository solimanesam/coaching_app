import 'package:cached_network_image/cached_network_image.dart';
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

  /// دالة لتحويل رابط Google Drive إلى رابط مباشر لعرض الصورة
  String? getFixedImageUrl(String? url) {
    if (url == null) return null;

    if (url.contains("drive.google.com")) {
      final match = RegExp(r'd/([^/]+)').firstMatch(url);
      if (match != null && match.groupCount >= 1) {
        final id = match.group(1);
        return "https://drive.google.com/uc?export=view&id=$id";
      }
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    final ClientDashboardController controller =
        Get.find<ClientDashboardController>();

    final String? fixedUrl = getFixedImageUrl(image);

    debugPrint("Original Image URL: $image");
    debugPrint("Fixed Image URL: $fixedUrl");

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
                backgroundImage: fixedUrl != null
                    ? CachedNetworkImageProvider(fixedUrl)
                    : null,
                child: fixedUrl == null
                    ? const Icon(Icons.person, size: 100, color: Colors.white)
                    : null,
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
