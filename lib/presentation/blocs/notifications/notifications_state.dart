part of 'notifications_bloc.dart';

enum LoadNotifStatus {
  initial,
  loading,
  success,
  failure,
}

class NotificationsState extends Equatable {
  final LoadNotifStatus loadNotifStatus;
  final AuthorizationStatus status;
  final List<PushMessage> notifications;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined, 
    this.notifications = const[],
    this.loadNotifStatus = LoadNotifStatus.initial,
  });

  NotificationsState copyWith({
    AuthorizationStatus? status,
    List<PushMessage>? notifications,
    LoadNotifStatus? loadNotifStatus
  }) => NotificationsState(
    status: status ?? this.status,
    notifications: notifications ?? this.notifications,
    loadNotifStatus: loadNotifStatus ?? this.loadNotifStatus,
  );
  
  @override
  List<Object> get props => [ status, notifications , loadNotifStatus ];
}

