import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackBarType { success, error, warning, info }

class AppSnackBar {
  static void show({
    required String message,
    SnackBarType type = SnackBarType.info,
    String? title,
  }) {
    final backgroundColor = _getColor(type);
    final icon = _getIcon(type);

    Get.snackbar(
      title ?? _getDefaultTitle(type),
      message,
      icon: Icon(icon, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static Color _getColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.error:
        return Colors.red;
      case SnackBarType.warning:
        return Colors.orange;
      case SnackBarType.info:
      default:
        return Colors.blue;
    }
  }

  static IconData _getIcon(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
      case SnackBarType.info:
      default:
        return Icons.info;
    }
  }

  static String _getDefaultTitle(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return 'Success';
      case SnackBarType.error:
        return 'Error';
      case SnackBarType.warning:
        return 'Warning';
      case SnackBarType.info:
      default:
        return 'Info';
    }
  }
}
