import 'package:firebase_messaging/firebase_messaging.dart';



class PushMessage {

  final String messageId;
  final String title;
  final String body;
  final DateTime sentDate;
  final Map<String,dynamic>? data;
  final String? imageUrl;
  final bool isRead;

  PushMessage({
    required this.messageId, 
    required this.title, 
    required this.body, 
    required this.sentDate, 
    this.data, 
    this.imageUrl,
    this.isRead = false
  });

  @override
  String toString() {
    return '''
PushMessage - 
  id:    $messageId
  title: $title
  body:  $body
  data:  $data
  imageUrl: $imageUrl
  sentDate: $sentDate
  isRead: $isRead
''';
  }

  factory PushMessage.fromRemoteMessage(RemoteMessage message, bool isAndroid) => PushMessage(
    messageId: message.messageId
        ?.replaceAll(':', '').replaceAll('%', '')
        ?? '',
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      sentDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: isAndroid
        ? message.notification!.android?.imageUrl
        : message.notification!.apple?.imageUrl
  );

}