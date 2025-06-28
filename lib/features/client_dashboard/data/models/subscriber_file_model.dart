import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';
import 'package:intl/intl.dart';

class SubscriberFileModel extends SubscriberFileEntity {
  const SubscriberFileModel({
    required super.fileName,
    required super.fileLink,
     super.downloadLink,
    required super.publishedDate,
     super.coachName,
  });

  factory SubscriberFileModel.fromJson(Map<String, dynamic> json) {
    final String rawDate = json["publishedDate"];
    final DateTime dateTime = DateTime.parse(rawDate);
    final String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

    return SubscriberFileModel(
      fileName: json["fileName"],
      fileLink: json["fileUrl"],
      downloadLink: json["downloadUrl"],
      publishedDate: formattedDate,
      coachName: json["coachName"],
    );
  }
  factory SubscriberFileModel.fromJsonByuser(Map<String, dynamic> json) {
    final String rawDate = json["publishedDate"];
    final DateTime dateTime = DateTime.parse(rawDate);
    final String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

    return SubscriberFileModel(
      fileName: json["fileName"],
      fileLink: json["fileUrl"],
      publishedDate: formattedDate,
    );
  }
}
