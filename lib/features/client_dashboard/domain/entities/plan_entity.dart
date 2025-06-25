import 'package:equatable/equatable.dart';

class CoachEntity extends Equatable {
  final String userName;
  final String email;
    
  const CoachEntity({
    required this.userName,
    required this.email,
  });

  @override
  List<Object?> get props => [userName, email];
}

class PlanEntity extends Equatable {
  final int id;
  final CoachEntity coach;
  final int price;
  final int durationInDays;
  final String details;
  final DateTime createdDate;

  const PlanEntity({
    required this.id,
    required this.coach,
    required this.price,
    required this.durationInDays,
    required this.details,
    required this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        coach,
        price,
        durationInDays,
        details,
        createdDate,
      ];
}
