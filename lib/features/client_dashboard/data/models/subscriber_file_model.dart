import 'package:coaching_app/features/client_dashboard/domain/entities/subscriber_file_entity.dart';

class SubscriberFileModel extends SubscriberFileEntity {
  const SubscriberFileModel(
      {required super.name,
      required super.fileUrl,
      required super.downloadUrl,
      required super.publishedDate,
      required super.coachName});

  factory SubscriberFileModel.fromJson(Map<String, dynamic> json) {
    return SubscriberFileModel(
        name: json["name"],
        fileUrl: json["fileUrl"],
        downloadUrl: json["downloadUrl"],
        publishedDate: json["publishedDate"],
        coachName: json["coachName"]);
  }
}