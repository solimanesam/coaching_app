import 'package:equatable/equatable.dart';

class Subscriber extends Equatable {
  const Subscriber({this.phoneNumber, 
      required this.height,
      required this.weight,
      required this.name,
      required this.image,
      required this.email});

  final String name, email;
  final String? image;
  final String? phoneNumber;
  final int height, weight;

  @override
  List<Object?> get props => [name, email, height, weight, image, phoneNumber];
}
