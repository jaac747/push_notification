import 'package:push_notification/config/database/database.dart';
import 'package:push_notification/domain/entities/push_message.dart';

abstract class LocalStorageDatasource {

  
  Future<int> addPushMessage(PushMessage pushMessage) ;
   
  Future<void> deletePushMessage(String messageId);

  Future<bool> isPushMessage(String messageId);

  Stream<List<PushNotificationData>> watchNotifications();

  Future<bool> markAsRead(String messageId) ;

  Future<void> clearAll();
}