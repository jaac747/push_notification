import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_notification/presentation/blocs/notifications/notifications_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAutorizated=false;
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (NotificationsBloc bloc ) 
          {
            String response ;
            if(bloc.state.status.name.toLowerCase()=="authorized"){
              response = "Notificaciones";
              isAutorizated =true;
            } else {
              response = "Necesita Autorizacion";
              isAutorizated = false;
            }
            return Text( response );
          }
        ),
        actions: [
          if(!isAutorizated)
          IconButton(onPressed: (){
            context.read<NotificationsBloc>()
              .requestPermission();
          }, 
          icon: const Icon( Icons.check_rounded )),
          IconButton(
            onPressed:() => _confirmDeleteAll(context)
            ,
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: const _HomeView(),
    );
  }

  Future<void> _confirmDeleteAll(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar todas las notificación'),
        content: const Text('¿Seguro que quieres eliminar todas las notificaciones?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    context.read<NotificationsBloc>().add(NotificationDeleteAll());
    
  }

}


class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    final notifications = context.watch<NotificationsBloc>().state.notifications;

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index) {
        final notification = notifications[index];
        return ListTile(
          title: Text( notification.title,style: notification.isRead? TextStyle(): TextStyle(fontWeight:  FontWeight.w600), ),
          subtitle: Text( notification.body,style: notification.isRead? TextStyle():  TextStyle(fontWeight:  FontWeight.w500), ),
          leading: notification.imageUrl != null 
            ? Image.network( notification.imageUrl! )
            : null,
          onTap: () {
            context.push('/push-details/${ notification.messageId }');
          },
        );
      },
    );
  }
}