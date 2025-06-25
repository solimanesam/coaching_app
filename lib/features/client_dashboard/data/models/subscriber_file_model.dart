import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:intl/intl.dart';

class SubscriberFileModel extends SubscriberFileEntity {
  const SubscriberFileModel({
    required super.fileName,
    required super.fileLink,
    required super.downloadLink,
    required super.publishedDate,
  });

  factory SubscriberFileModel.fromJson(Map<String, dynamic> json) {
    // Parse the date and format it without seconds
    final String rawDate = json["publishedDate"];
    final DateTime dateTime = DateTime.parse(rawDate);
    final String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

    return SubscriberFileModel(
      fileName: json["fileName"],
      fileLink: json["fileUrl"],
      downloadLink: json["downloadUrl"],
      publishedDate: formattedDate,
    );
  }
}
