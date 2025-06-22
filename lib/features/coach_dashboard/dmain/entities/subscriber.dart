import 'package:equatable/equatable.dart';

class Subscriber extends Equatable{
   const  Subscriber({required this.name, required this.email});

  final String name, email;

  @override
  List<Object?> get props => [name, email];
}