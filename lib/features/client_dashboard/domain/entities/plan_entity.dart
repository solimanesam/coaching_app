import 'package:equatable/equatable.dart';

class PlanEntity extends Equatable {
  final int id;
  final String coachId;
  final String coach;
  final int price;
  final int durationInDays;
  final String details;
  final DateTime createdDate;

  const PlanEntity({
    required this.id,
    required this.coachId,
    required this.coach,
    required this.price,
    required this.durationInDays,
    required this.details,
    required this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        coachId,
        coach,
        price,
        durationInDays,
        details,
        createdDate,
      ];
}