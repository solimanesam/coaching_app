import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class CoachEntity extends Equatable {
  const CoachEntity({required this.image, required this.name});

  final String name;
  final Uint8List? image;

  @override
  List<Object?> get props => [name, image];
}
