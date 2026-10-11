import 'dart:io';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notification/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification/domain/entities/push_message.dart';
import 'package:push_notification/domain/repositories/local_storage_repository.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final LocalStorageRepository repository;
  final List<StreamSubscription<RemoteMessage>> _fcmSubs = [];
  final Future<void> Function()? requestNotificationsPermission;
  final void Function({required int id, String? titlle, String? body, String? data })? showLocalNotification;

  NotificationsBloc({
    required this.repository,
    this.requestNotificationsPermission,
    this.showLocalNotification
  }) : super( const NotificationsState() ) {

    on<NotificationStatusChanged>( _notificationStatusChanged );
    on<NotificationReceived>( _onPushMessageReceived );
    on<NotificationMarkedAsRead> ( _onMarkedAsRead );
    on<NotificationDelete> ( _onDeleted );
    on<NotificationsSubscribed>(_onSubscribed);
    on<NotificationDeleteAll> (_onDeletedAll);

    // Verificar estado de las notificaciones
    _initialStatusCheck();

    // Listener para notificaciones 
    _onForegroundMessage();
    
    add(NotificationsSubscribed());
  }

  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // ---- Observa la tabla: cada insert/update/delete re-emite el estado
  Future<void> _onSubscribed(
    NotificationsSubscribed event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(loadNotifStatus: LoadNotifStatus.loading));

    await emit.forEach<List<PushMessage>>(
      repository.watchNotifications(),
      onData: (list) => state.copyWith(
        notifications: list,
        loadNotifStatus: LoadNotifStatus.success,
      ),
      onError: (_, _) => state.copyWith(loadNotifStatus: LoadNotifStatus.failure),
    );
  }

  Future<void> _onDeleted(NotificationDelete event, Emitter<NotificationsState> emit) async{
    repository.deletePushMessage(event.messageId);
  }

  Future<void> _onDeletedAll(NotificationDeleteAll event, Emitter<NotificationsState> emit) async{
    repository.clearAll();
  }

  Future<void> _onMarkedAsRead( NotificationMarkedAsRead event, Emitter<NotificationsState> emit) async {
    repository.markAsRead(event.messageId);
  } 

  void _notificationStatusChanged( NotificationStatusChanged event, Emitter<NotificationsState> emit ) {
    emit(
      state.copyWith(
        status: event.status
      )
    );
    _getFCMToken();
  }
  
  void _onPushMessageReceived( NotificationReceived event, Emitter<NotificationsState> emit ) async {
    final idNotification = await repository.addPushMessage(event.pushMessage);
    if(showLocalNotification != null ){
      showLocalNotification!(
        id: idNotification,
        titlle: event.pushMessage.title,
        body: event.pushMessage.body,
        data: event.pushMessage.messageId,
      );
    }
  }


  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add( NotificationStatusChanged(settings.authorizationStatus) );
  }

  void _getFCMToken() async {
    
    if ( state.status != AuthorizationStatus.authorized ) return;
  
    final token = await messaging.getToken();
    print("Token: $token");
  }

  void handlePushMessage( PushMessage pushMessage ){
    add( NotificationReceived(pushMessage) );
  }

  void handleRemoteMessage( RemoteMessage message ) {
    if (message.notification == null) return;
    
    final pushMessage = PushMessage.fromRemoteMessage( message , Platform.isAndroid);

    handlePushMessage(pushMessage);
    
  }



  void _onForegroundMessage(){ 
    _fcmSubs.add(FirebaseMessaging.onMessage.listen(handleRemoteMessage));
  }


  void requestPermission() async {
    
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    if( requestNotificationsPermission != null ){
      requestNotificationsPermission!();
    }
    add( NotificationStatusChanged(settings.authorizationStatus) );
  }

  PushMessage? getMessageById( String pushMessageId ) {
    final exist = state.notifications.any((element) => element.messageId == pushMessageId );
    if ( !exist ) return null;

    return state.notifications.firstWhere((element) => element.messageId == pushMessageId );
  }

  @override
  Future<void> close() {
    for (final s in _fcmSubs) {
      s.cancel();
    }
    return super.close();
  }

}
