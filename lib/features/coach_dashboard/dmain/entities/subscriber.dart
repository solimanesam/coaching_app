import 'package:equatable/equatable.dart';

class Subscriber extends Equatable {
  const Subscriber(
      {required this.height,
      required this.weight,
      required this.name,
      required this.email});

  final String name, email;
  final int height, weight;

  @override
  List<Object?> get props => [name, email, height, weight];
}
