import 'package:push_notification/config/database/database.dart';
import 'package:push_notification/domain/entities/push_message.dart';
import 'package:push_notification/domain/datasources/local_storage_datasource.dart';
import 'package:push_notification/domain/repositories/local_storage_repository.dart';


class LocalStorageRepositoryImp extends LocalStorageRepository{

  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImp({required this.datasource});
  
  @override
  Future<bool> isPushMessage(String messageId) =>
    datasource.isPushMessage(messageId);

  @override
  Future<void> deletePushMessage(String messageId) =>
    datasource.deletePushMessage(messageId);

  @override
  Future<bool> markAsRead(String messageId) =>
    datasource.markAsRead(messageId);

  @override
  Future<void> clearAll() => 
    datasource.clearAll();

  @override
  Future<int> addPushMessage(PushMessage pushMessage) => 
     datasource.addPushMessage(pushMessage);
  
  @override
  Stream<List<PushMessage>> watchNotifications() {
    return datasource.watchNotifications().map(
      (rows) => rows.map(_toMessage).toList() 
    );
  }

  PushMessage _toMessage(PushNotificationData row) => PushMessage(
    messageId: row.messageId, 
    title: row.title, 
    body: row.body, 
    sentDate: row.sentDate,
    data: row.data,
    imageUrl: row.imageUrl,
    isRead: row.isRead
  );
  
}