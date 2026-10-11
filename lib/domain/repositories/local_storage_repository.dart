import 'package:push_notification/domain/entities/push_message.dart';



abstract class LocalStorageRepository {

  Future<int> addPushMessage(PushMessage pushMessage) ;
   
  Future<void> deletePushMessage(String messageId);

  Future<bool> isPushMessage(String messageId);

  Stream<List<PushMessage>> watchNotifications();

  Future<bool> markAsRead(String messageId) ;

  Future<void> clearAll();
}