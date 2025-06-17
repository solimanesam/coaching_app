import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coaching_app/core/services/image_picker_service.dart';

Future<void> showImageSourceBottomSheet({
  required void Function(ImageSourceType) onSourceSelected,
}) async {
  Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Camera"),
            onTap: () {
              Get.back();
              onSourceSelected(ImageSourceType.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Gallery"),
            onTap: () {
              Get.back();
              onSourceSelected(ImageSourceType.gallery);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text("Cancel"),
            onTap: () => Get.back(),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}
