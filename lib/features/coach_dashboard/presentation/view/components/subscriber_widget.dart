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

  @override
  Widget build(BuildContext context) {
    final String firstLetter =
        subscriber.name.isNotEmpty ? subscriber.name[0].toUpperCase() : '?';

    return GestureDetector(
      onTap: () => Get.to(SubscriberPage(subscriber: subscriber)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primaryColor,
            child: Text(
              firstLetter,
              style: TextStyles.semiBold20(context, color: AppColors.white),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            subscriber.name,
            style: TextStyles.semiBold18(
                context: context, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
