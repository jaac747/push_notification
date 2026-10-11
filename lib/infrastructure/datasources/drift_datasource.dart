import 'package:drift/drift.dart' as drift;
import 'package:push_notification/config/database/database.dart';
import 'package:push_notification/domain/entities/push_message.dart';
import 'package:push_notification/domain/datasources/local_storage_datasource.dart';



class DriftDatasource extends LocalStorageDatasource {

  final AppDatabase database;

  DriftDatasource([AppDatabase? databaseToUse])
  :database = databaseToUse ?? db ;

  @override
  Future<bool> isPushMessage(String messageId) async {
    final query = database.select(database.pushNotification)
              ..where((tbl) => tbl.messageId.equals(messageId));
    final pushMessage = await query.getSingleOrNull();
    return pushMessage != null;
  }

  @override
  Stream<List<PushNotificationData>> watchNotifications() {
    final query = database.select(database.pushNotification)
    ..orderBy([
      (tbl) => drift.OrderingTerm.asc( tbl.sentDate)
    ])
    ;

    return  query.watch();

    
  }

  @override
  Future<int> addPushMessage(PushMessage pushMessage) async {
    final existPushMessage = await isPushMessage(pushMessage.messageId);
    if(!existPushMessage){
      return await database.into(database.pushNotification)
          .insert(PushNotificationCompanion.insert(
            messageId: pushMessage.messageId, 
            body: pushMessage.body, 
            title: pushMessage.title, 
            sentDate: pushMessage.sentDate,
            imageUrl: drift.Value(pushMessage.imageUrl),
            data: drift.Value(pushMessage.data)
            
            ), mode: drift.InsertMode.insertOrIgnore ) ;
    }
    return -1;
  }
  
  @override
  Future<void> deletePushMessage(String messageId) async {
    final existPushMessage = await isPushMessage(messageId);
    if(existPushMessage){
      final deleteQuery = database.delete(database.pushNotification)
        ..where((tbl) => tbl.messageId.equals(messageId));

        await deleteQuery.go();
    }
  }

  @override
  Future<bool> markAsRead(String messageId)  async {
    final affectedRows =
        await (database.update(database.pushNotification)
              ..where((table) => table.messageId.equals(messageId)))
            .write(
      const PushNotificationCompanion(
        isRead: drift.Value(true),
      ),
    );

    return affectedRows > 0;
  }

  @override
  Future<void> clearAll() => database.delete(database.pushNotification).go();

}