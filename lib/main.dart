import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification/config/theme/app_theme.dart';
import 'package:push_notification/config/database/database.dart';
import 'package:push_notification/config/router/app_router.dart';
import 'package:push_notification/domain/entities/push_message.dart';
import 'package:push_notification/infrastructure/datasources/drift_datasource.dart';
import 'package:push_notification/config/local_notification/local_notification.dart';
import 'package:push_notification/domain/repositories/local_storage_repository.dart';
import 'package:push_notification/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:push_notification/infrastructure/repositories/local_storage_repository_imp.dart';





@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationsBloc.initializeFCM(); // reutiliza tu init con DefaultFirebaseOptions
  
  // Otro isolate: no hay acceso a tus providers, así que crea su propia instancia
  final db = AppDatabase();
  final repository = LocalStorageRepositoryImp(datasource: DriftDatasource(db));
  await repository.addPushMessage(PushMessage.fromRemoteMessage(message, Platform.isAndroid));
  await db.close();
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsBloc.initializeFCM();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  LocalStorageRepository repository = LocalStorageRepositoryImp(datasource: DriftDatasource(db));
  await LocalNotification.initializeLocalNotification();
  //await LocalNotification.checkLaunchNotification();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotificationsBloc(
          repository:repository,
          requestNotificationsPermission: LocalNotification.requestNotificationsPermission,
          showLocalNotification: LocalNotification.showLocalNotification
        ))
      ], 
      child: const MainApp())
    
  );

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      builder: (context, child) => HandleNotificationInteractions(child: child!),
    );
  }
}


class HandleNotificationInteractions extends StatefulWidget {
  
  final Widget child;
  const HandleNotificationInteractions({super.key, required this.child});

  @override
  State<HandleNotificationInteractions> createState() => _HandleNotificationInteractionsState();
}

class _HandleNotificationInteractionsState extends State<HandleNotificationInteractions> {

  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }
  
  void _handleMessage(RemoteMessage message) {
    final pushMessage = PushMessage.fromRemoteMessage( message , Platform.isAndroid);
    context.read<NotificationsBloc>()
      .handlePushMessage(pushMessage);

    final messageId = pushMessage.messageId;
    Future.delayed(const Duration(milliseconds: 500), () {
      appRouter.push('/push-details/$messageId');
    });
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

