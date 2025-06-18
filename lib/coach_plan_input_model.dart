import 'package:equatable/equatable.dart';

class CoachPlanInputModel extends Equatable{
  const CoachPlanInputModel({
    required this.price,
    required this.durationInDays,
    required this.details
  });
  
  final String price, durationInDays, details;
  
  @override
  List<Object?> get props => [
    price,
    durationInDays,
    details
  ];
}