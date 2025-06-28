import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriberFileWidgetByUser extends StatelessWidget {
  const SubscriberFileWidgetByUser({super.key, required this.file});

  final SubscriberFileEntity file;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              file.fileName,
              style: TextStyles.semiBold18(context: context, color: AppColors.black),
            ),
            const SizedBox(height: 8),
            Text(
              "Published: ${file.publishedDate}",
              style: TextStyles.regular14(context, color: AppColors.grey),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () async {
                final uri = Uri.parse(file.fileLink);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Could not open file link")),
                  );
                }
              },
              child: Row(
                children: [
                  const Icon(Icons.link, size: 20, color: AppColors.primaryColor),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      file.fileLink,
                      style: TextStyles.regular14(context, color: AppColors.primaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
