import 'package:equatable/equatable.dart';

class CvEntity extends Equatable {
  final String downloadCv;
  final String openCv;

  const CvEntity({required this.downloadCv, required this.openCv});

  @override
  List<Object?> get props => [downloadCv, openCv];
}
