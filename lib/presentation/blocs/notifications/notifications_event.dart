part of 'notifications_bloc.dart';

abstract class NotificationsEvent {
  const NotificationsEvent();
}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;
  NotificationStatusChanged(this.status);
}

class NotificationReceived extends NotificationsEvent {
  final PushMessage pushMessage;
  NotificationReceived(this.pushMessage);
}

class NotificationMarkedAsRead extends NotificationsEvent {
  final String messageId;
  NotificationMarkedAsRead(this.messageId);
}

class NotificationDelete extends NotificationsEvent {
  final String messageId;
  NotificationDelete(this.messageId);
}

class NotificationDeleteAll extends NotificationsEvent {}

class NotificationsSubscribed extends NotificationsEvent {}