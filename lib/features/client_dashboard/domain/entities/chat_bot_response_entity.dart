import 'package:equatable/equatable.dart';

class ChatBotResponseEntity extends Equatable {
  final String answer;

  const ChatBotResponseEntity({required this.answer});
  @override
  List<Object?> get props => [answer];
}
