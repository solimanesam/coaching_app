import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/features/coach_dashboard/dmain/entities/subscriber.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/subscriber_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SubscriberWidget extends StatelessWidget {
  const SubscriberWidget({
    super.key,
    required this.subscriber,
  });

  final Subscriber subscriber;

  /// دالة لتحويل رابط Google Drive إلى رابط صورة مباشر
  String getDirectImageLink(String rawUrl) {
    final idRegExp = RegExp(r'd/([^/]+)');
    final match = idRegExp.firstMatch(rawUrl);
    if (match != null) {
      final fileId = match.group(1);
      return "https://drive.google.com/uc?export=view&id=$fileId";
    }
    return rawUrl; // fallback
  }

  @override
  Widget build(BuildContext context) {
    final String firstLetter =
        subscriber.name.isNotEmpty ? subscriber.name[0].toUpperCase() : '?';

    final String? imageUrl = subscriber.image != null
        ? getDirectImageLink(subscriber.image!)
        : null;

    return GestureDetector(
      onTap: () => Get.to(SubscriberPage(subscriber: subscriber)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primaryColor,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
            child: imageUrl == null
                ? Text(
                    firstLetter,
                    style: TextStyles.semiBold20(context, color: AppColors.white),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            subscriber.name,
            style: TextStyles.semiBold18(
              context: context,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
