import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_information_state.dart';

class ClientInformationCubit extends Cubit<ClientInformationState> {
  ClientInformationCubit() : super(const ClientInformationState());
  changeStateOfCheckBox({required int index}) {
    emit(ClientInformationState(selectedCheckBox: index));
  }
}
