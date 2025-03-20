part of 'client_information_cubit.dart';

class ClientInformationState extends Equatable {
  final int? selectedCheckBox;
  const ClientInformationState({this.selectedCheckBox});

  @override
  List<Object?> get props => [selectedCheckBox];
}
