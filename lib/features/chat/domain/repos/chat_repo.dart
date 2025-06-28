import 'package:coaching_app/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepo {
  Future<void> connect({required String currentUsername});
  Future<void> sendMessage(MessageEntity message);
  Stream<MessageEntity> receiveMessages();
  Future<void> disconnect();
  Future<void> cacheMessage(MessageEntity message);
  Future<List<MessageEntity>> loadCachedMessages();
}