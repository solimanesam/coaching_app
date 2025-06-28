import 'package:equatable/equatable.dart';

class SubscriberFileEntity extends Equatable {
  const SubscriberFileEntity({
    required this.coachName,
    required this.fileName,
    required this.fileLink,
    required this.downloadLink,
    required this.publishedDate,
  });

  final String fileName, fileLink, publishedDate;
  final String? coachName, downloadLink;

  @override
  List<Object?> get props =>
      [fileName, fileLink, downloadLink, publishedDate, coachName];
}
