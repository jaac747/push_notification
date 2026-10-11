// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PushNotificationTable extends PushNotification
    with TableInfo<$PushNotificationTable, PushNotificationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PushNotificationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _messageIdMeta = const VerificationMeta(
    'messageId',
  );
  @override
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
    'message_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'imageUrl',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sentDateMeta = const VerificationMeta(
    'sentDate',
  );
  @override
  late final GeneratedColumn<DateTime> sentDate = GeneratedColumn<DateTime>(
    'sent_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
  data = GeneratedColumn<String>(
    'data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<Map<String, dynamic>?>($PushNotificationTable.$converterdata);
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messageId,
    body,
    imageUrl,
    title,
    sentDate,
    data,
    isRead,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'push_notification';
  @override
  VerificationContext validateIntegrity(
    Insertable<PushNotificationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message_id')) {
      context.handle(
        _messageIdMeta,
        messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('imageUrl')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['imageUrl']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('sent_date')) {
      context.handle(
        _sentDateMeta,
        sentDate.isAcceptableOrUnknown(data['sent_date']!, _sentDateMeta),
      );
    } else if (isInserting) {
      context.missing(_sentDateMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PushNotificationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PushNotificationData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      messageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_id'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imageUrl'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      sentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sent_date'],
      )!,
      data: $PushNotificationTable.$converterdata.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}data'],
        ),
      ),
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
    );
  }

  @override
  $PushNotificationTable createAlias(String alias) {
    return $PushNotificationTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>?, String?> $converterdata =
      const MapConverter();
}

class PushNotificationData extends DataClass
    implements Insertable<PushNotificationData> {
  final int id;
  final String messageId;
  final String body;
  final String? imageUrl;
  final String title;
  final DateTime sentDate;
  final Map<String, dynamic>? data;
  final bool isRead;
  const PushNotificationData({
    required this.id,
    required this.messageId,
    required this.body,
    this.imageUrl,
    required this.title,
    required this.sentDate,
    this.data,
    required this.isRead,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['message_id'] = Variable<String>(messageId);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || imageUrl != null) {
      map['imageUrl'] = Variable<String>(imageUrl);
    }
    map['title'] = Variable<String>(title);
    map['sent_date'] = Variable<DateTime>(sentDate);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(
        $PushNotificationTable.$converterdata.toSql(data),
      );
    }
    map['is_read'] = Variable<bool>(isRead);
    return map;
  }

  PushNotificationCompanion toCompanion(bool nullToAbsent) {
    return PushNotificationCompanion(
      id: Value(id),
      messageId: Value(messageId),
      body: Value(body),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      title: Value(title),
      sentDate: Value(sentDate),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      isRead: Value(isRead),
    );
  }

  factory PushNotificationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PushNotificationData(
      id: serializer.fromJson<int>(json['id']),
      messageId: serializer.fromJson<String>(json['messageId']),
      body: serializer.fromJson<String>(json['body']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      title: serializer.fromJson<String>(json['title']),
      sentDate: serializer.fromJson<DateTime>(json['sentDate']),
      data: serializer.fromJson<Map<String, dynamic>?>(json['data']),
      isRead: serializer.fromJson<bool>(json['isRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'messageId': serializer.toJson<String>(messageId),
      'body': serializer.toJson<String>(body),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'title': serializer.toJson<String>(title),
      'sentDate': serializer.toJson<DateTime>(sentDate),
      'data': serializer.toJson<Map<String, dynamic>?>(data),
      'isRead': serializer.toJson<bool>(isRead),
    };
  }

  PushNotificationData copyWith({
    int? id,
    String? messageId,
    String? body,
    Value<String?> imageUrl = const Value.absent(),
    String? title,
    DateTime? sentDate,
    Value<Map<String, dynamic>?> data = const Value.absent(),
    bool? isRead,
  }) => PushNotificationData(
    id: id ?? this.id,
    messageId: messageId ?? this.messageId,
    body: body ?? this.body,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    title: title ?? this.title,
    sentDate: sentDate ?? this.sentDate,
    data: data.present ? data.value : this.data,
    isRead: isRead ?? this.isRead,
  );
  PushNotificationData copyWithCompanion(PushNotificationCompanion data) {
    return PushNotificationData(
      id: data.id.present ? data.id.value : this.id,
      messageId: data.messageId.present ? data.messageId.value : this.messageId,
      body: data.body.present ? data.body.value : this.body,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      title: data.title.present ? data.title.value : this.title,
      sentDate: data.sentDate.present ? data.sentDate.value : this.sentDate,
      data: data.data.present ? data.data.value : this.data,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PushNotificationData(')
          ..write('id: $id, ')
          ..write('messageId: $messageId, ')
          ..write('body: $body, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('title: $title, ')
          ..write('sentDate: $sentDate, ')
          ..write('data: $data, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, messageId, body, imageUrl, title, sentDate, data, isRead);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PushNotificationData &&
          other.id == this.id &&
          other.messageId == this.messageId &&
          other.body == this.body &&
          other.imageUrl == this.imageUrl &&
          other.title == this.title &&
          other.sentDate == this.sentDate &&
          other.data == this.data &&
          other.isRead == this.isRead);
}

class PushNotificationCompanion extends UpdateCompanion<PushNotificationData> {
  final Value<int> id;
  final Value<String> messageId;
  final Value<String> body;
  final Value<String?> imageUrl;
  final Value<String> title;
  final Value<DateTime> sentDate;
  final Value<Map<String, dynamic>?> data;
  final Value<bool> isRead;
  const PushNotificationCompanion({
    this.id = const Value.absent(),
    this.messageId = const Value.absent(),
    this.body = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.title = const Value.absent(),
    this.sentDate = const Value.absent(),
    this.data = const Value.absent(),
    this.isRead = const Value.absent(),
  });
  PushNotificationCompanion.insert({
    this.id = const Value.absent(),
    required String messageId,
    required String body,
    this.imageUrl = const Value.absent(),
    required String title,
    required DateTime sentDate,
    this.data = const Value.absent(),
    this.isRead = const Value.absent(),
  }) : messageId = Value(messageId),
       body = Value(body),
       title = Value(title),
       sentDate = Value(sentDate);
  static Insertable<PushNotificationData> custom({
    Expression<int>? id,
    Expression<String>? messageId,
    Expression<String>? body,
    Expression<String>? imageUrl,
    Expression<String>? title,
    Expression<DateTime>? sentDate,
    Expression<String>? data,
    Expression<bool>? isRead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messageId != null) 'message_id': messageId,
      if (body != null) 'body': body,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (title != null) 'title': title,
      if (sentDate != null) 'sent_date': sentDate,
      if (data != null) 'data': data,
      if (isRead != null) 'is_read': isRead,
    });
  }

  PushNotificationCompanion copyWith({
    Value<int>? id,
    Value<String>? messageId,
    Value<String>? body,
    Value<String?>? imageUrl,
    Value<String>? title,
    Value<DateTime>? sentDate,
    Value<Map<String, dynamic>?>? data,
    Value<bool>? isRead,
  }) {
    return PushNotificationCompanion(
      id: id ?? this.id,
      messageId: messageId ?? this.messageId,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      sentDate: sentDate ?? this.sentDate,
      data: data ?? this.data,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (messageId.present) {
      map['message_id'] = Variable<String>(messageId.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (imageUrl.present) {
      map['imageUrl'] = Variable<String>(imageUrl.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (sentDate.present) {
      map['sent_date'] = Variable<DateTime>(sentDate.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(
        $PushNotificationTable.$converterdata.toSql(data.value),
      );
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PushNotificationCompanion(')
          ..write('id: $id, ')
          ..write('messageId: $messageId, ')
          ..write('body: $body, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('title: $title, ')
          ..write('sentDate: $sentDate, ')
          ..write('data: $data, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PushNotificationTable pushNotification = $PushNotificationTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pushNotification];
}

typedef $$PushNotificationTableCreateCompanionBuilder =
    PushNotificationCompanion Function({
      Value<int> id,
      required String messageId,
      required String body,
      Value<String?> imageUrl,
      required String title,
      required DateTime sentDate,
      Value<Map<String, dynamic>?> data,
      Value<bool> isRead,
    });
typedef $$PushNotificationTableUpdateCompanionBuilder =
    PushNotificationCompanion Function({
      Value<int> id,
      Value<String> messageId,
      Value<String> body,
      Value<String?> imageUrl,
      Value<String> title,
      Value<DateTime> sentDate,
      Value<Map<String, dynamic>?> data,
      Value<bool> isRead,
    });

class $$PushNotificationTableFilterComposer
    extends Composer<_$AppDatabase, $PushNotificationTable> {
  $$PushNotificationTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sentDate => $composableBuilder(
    column: $table.sentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, dynamic>?,
    Map<String, dynamic>,
    String
  >
  get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PushNotificationTableOrderingComposer
    extends Composer<_$AppDatabase, $PushNotificationTable> {
  $$PushNotificationTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sentDate => $composableBuilder(
    column: $table.sentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PushNotificationTableAnnotationComposer
    extends Composer<_$AppDatabase, $PushNotificationTable> {
  $$PushNotificationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get messageId =>
      $composableBuilder(column: $table.messageId, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get sentDate =>
      $composableBuilder(column: $table.sentDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);
}

class $$PushNotificationTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PushNotificationTable,
          PushNotificationData,
          $$PushNotificationTableFilterComposer,
          $$PushNotificationTableOrderingComposer,
          $$PushNotificationTableAnnotationComposer,
          $$PushNotificationTableCreateCompanionBuilder,
          $$PushNotificationTableUpdateCompanionBuilder,
          (
            PushNotificationData,
            BaseReferences<
              _$AppDatabase,
              $PushNotificationTable,
              PushNotificationData
            >,
          ),
          PushNotificationData,
          PrefetchHooks Function()
        > {
  $$PushNotificationTableTableManager(
    _$AppDatabase db,
    $PushNotificationTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PushNotificationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PushNotificationTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PushNotificationTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> messageId = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> sentDate = const Value.absent(),
                Value<Map<String, dynamic>?> data = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
              }) => PushNotificationCompanion(
                id: id,
                messageId: messageId,
                body: body,
                imageUrl: imageUrl,
                title: title,
                sentDate: sentDate,
                data: data,
                isRead: isRead,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String messageId,
                required String body,
                Value<String?> imageUrl = const Value.absent(),
                required String title,
                required DateTime sentDate,
                Value<Map<String, dynamic>?> data = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
              }) => PushNotificationCompanion.insert(
                id: id,
                messageId: messageId,
                body: body,
                imageUrl: imageUrl,
                title: title,
                sentDate: sentDate,
                data: data,
                isRead: isRead,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PushNotificationTable, PushNotificationData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $PushNotificationTable,
                    PushNotificationData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PushNotificationTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PushNotificationTable,
      PushNotificationData,
      $$PushNotificationTableFilterComposer,
      $$PushNotificationTableOrderingComposer,
      $$PushNotificationTableAnnotationComposer,
      $$PushNotificationTableCreateCompanionBuilder,
      $$PushNotificationTableUpdateCompanionBuilder,
      (
        PushNotificationData,
        BaseReferences<
          _$AppDatabase,
          $PushNotificationTable,
          PushNotificationData
        >,
      ),
      PushNotificationData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PushNotificationTableTableManager get pushNotification =>
      $$PushNotificationTableTableManager(_db, _db.pushNotification);
}
