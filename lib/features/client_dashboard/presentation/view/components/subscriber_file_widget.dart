import 'package:coaching_app/core/helper_function/launch_cv.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:flutter/material.dart';

class SubscriberFileWidget extends StatelessWidget {
  const SubscriberFileWidget({super.key, required this.file});

  final SubscriberFileEntity file;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// File name
            Text(
              file.fileName,
              style: TextStyles.semiBold20(context, color: Colors.black),
            ),

            const SizedBox(height: 8),

            /// Coach name
            if(file.coachName  != null) Text(
              'Coach: ${file.coachName}',
              style:
                  TextStyles.semiBold18(context: context, color: Colors.grey),
            ),

            /// Published Date
            Text(
              'Published: ${file.publishedDate}',
              style:
                  TextStyles.semiBold18(context: context, color: Colors.grey),
            ),

            const SizedBox(height: 12),

            /// File link & Download button
            FileLinkWidget(
                downloadLink: file.downloadLink!, viewLink: file.fileLink),
          ],
        ),
      ),
    );
  }
}

class FileLinkWidget extends StatelessWidget {
  const FileLinkWidget({
    super.key,
    required this.viewLink,
    required this.downloadLink,
  });

  final String viewLink, downloadLink;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// File link (truncated)
        Expanded(
          child: TextButton(
            onPressed: () => launchLink(viewLink),
            child: Text(
              viewLink,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.blue[700],
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),

        /// Download Button
        IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {
            // You can implement actual download logic here using url_launcher or Dio
            launchLink(downloadLink);
          },
        ),
      ],
    );
  }
}
