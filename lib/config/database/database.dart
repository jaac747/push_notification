import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:push_notification/config/database/map_convert_data.dart';

part 'database.g.dart';

class PushNotification extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get messageId => text().named('message_id')();
  TextColumn get body => text()();
  TextColumn get imageUrl => text().nullable().named('imageUrl')();
  TextColumn get title => text()();
  DateTimeColumn get sentDate => dateTime().named('sent_date')();
  TextColumn get data => text().nullable().map(const MapConverter())();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();

}


@DriftDatabase(tables: [PushNotification])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
        shareAcrossIsolates: true
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}


final db = AppDatabase();