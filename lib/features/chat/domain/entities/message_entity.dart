class MessageEntity {
  final String senderUsername;
  final String receiverUsername;
  final String message;
  final DateTime timestamp;

  MessageEntity({
    required this.senderUsername,
    required this.receiverUsername,
    required this.message,
    required this.timestamp,
  });
}