import 'package:equatable/equatable.dart';

class SubscriberFileEntity extends Equatable {
  const SubscriberFileEntity(
      {required this.fileName,
      required this.fileLink,
      required this.downloadLink,
      required this.publishedDate,
      });

  final String fileName, fileLink, downloadLink, publishedDate;

  @override
  List<Object?> get props =>
      [fileName, fileLink, downloadLink, publishedDate, ];
}
