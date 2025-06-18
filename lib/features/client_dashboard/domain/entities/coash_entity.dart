import 'package:equatable/equatable.dart';

class CoachEntity extends Equatable {
  const CoachEntity({required this.image, required this.name});

  final String name;
  final String image;

  @override
  List<Object?> get props => [name, image];
}
