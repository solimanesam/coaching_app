import 'package:equatable/equatable.dart';

class SubscriberFileEntity extends Equatable {
  const SubscriberFileEntity(
      {required this.name,
      required this.fileUrl,
      required this.downloadUrl,
      required this.publishedDate,
      required this.coachName});

  final String name, fileUrl, downloadUrl, publishedDate, coachName;

  @override
  List<Object?> get props =>
      [name, fileUrl, downloadUrl, publishedDate, coachName];
}