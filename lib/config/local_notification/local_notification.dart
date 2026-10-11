import 'package:push_notification/config/router/app_router.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {


  static final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static Future<void> requestNotificationsPermission() async {
    
    await _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

  }

  static Future<void> initializeLocalNotification() async{

    

    const initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    const darwinInitializationSettings = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS:  darwinInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse
    );

  }

  static void iosShowLocalNotification(int id, String? title, String? body, String? data,){
    showLocalNotification(id: id,titlle:title,body: body,data: data );
  }

  static void showLocalNotification({
    required int id,
    String? titlle,
    String? body,
    String? data,
  }){

    const androidDetails = AndroidNotificationDetails(
      'channelId', 
      'channelName',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
      icon: 'app_icon'
    );

    const darwingDetails = DarwinNotificationDetails(
      presentSound: true,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwingDetails,
    );
    
    _flutterLocalNotificationsPlugin.show(id: id,body: body,title: titlle,notificationDetails: notificationDetails,payload: data);
      
  }

  static void  onDidReceiveNotificationResponse(NotificationResponse notificationResponse){
    appRouter.push( '/push-details/${notificationResponse.payload}');
  }

   /*static Future<void> checkLaunchNotification() async {
    final NotificationAppLaunchDetails? launchDetails =
        await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
        
    if (launchDetails != null && launchDetails.didNotificationLaunchApp) {
      final String? payload = launchDetails.notificationResponse?.payload;
      if (payload != null && payload.isNotEmpty) {
        // Un pequeño delay asegura que GoRouter y la pantalla inicial ya estén listos
        Future.delayed(const Duration(milliseconds: 500), () {
          appRouter.push('/push-details/$payload');
        });
      }
    }
  }*/

}