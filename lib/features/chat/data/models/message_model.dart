import 'package:hive/hive.dart';

class MessageModel {
  final String senderUsername;
  final String receiverUsername;
  final String message;
  final DateTime timestamp;

  MessageModel({
    required this.senderUsername,
    required this.receiverUsername,
    required this.message,
    required this.timestamp,
  });
}

class MessageModelAdapter extends TypeAdapter<MessageModel> {
  @override
  final int typeId = 1;

  @override
  MessageModel read(BinaryReader reader) {
    final senderUsername = reader.readString();
    final receiverUsername = reader.readString();
    final message = reader.readString();
    final timestamp = DateTime.fromMillisecondsSinceEpoch(reader.readInt());
    return MessageModel(
      senderUsername: senderUsername,
      receiverUsername: receiverUsername,
      message: message,
      timestamp: timestamp,
    );
  }

  @override
  void write(BinaryWriter writer, MessageModel obj) {
    writer.writeString(obj.senderUsername);
    writer.writeString(obj.receiverUsername);
    writer.writeString(obj.message);
    writer.writeInt(obj.timestamp.millisecondsSinceEpoch);
  }
}
