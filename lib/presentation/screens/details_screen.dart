import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_notification/config/router/app_router.dart';
import 'package:push_notification/domain/entities/push_message.dart';
import 'package:push_notification/presentation/blocs/notifications/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {

  final String pushMessageId;

  const DetailsScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {

     return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        final message =
            context.read<NotificationsBloc>().getMessageById(pushMessageId);

        if (message == null) {
          if( state.loadNotifStatus != LoadNotifStatus.success ){
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('Notificación no encontrada')),
          );
        }
        if(!message.isRead){
          context.read<NotificationsBloc>().add(NotificationMarkedAsRead(message.messageId));
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalles Push'),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _confirmDelete(context, message),
              ),
            ],
          ),
          body:  _DetailsView(message: message)
            
        );
      }
    );
  }

  Future<void> _confirmDelete(BuildContext context, PushMessage message) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar notificación'),
        content: const Text('¿Seguro que quieres eliminarla?'),
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

    context.read<NotificationsBloc>().add(NotificationDelete(message.messageId));

    // Si la app se abrió desde una notificación, puede que no haya pantalla anterior
    if (appRouter.canPop()) {
      appRouter.pop();
    } else {
      appRouter.go('/');
    }
  }

}

class _DetailsView extends StatelessWidget {

  final PushMessage message;

  const _DetailsView({ required this.message });

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;
    if (message.imageUrl != null )
      print(message.imageUrl);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [

          if ( message.imageUrl != null ) 
            Image.network(message.imageUrl!),

          const SizedBox( height: 30 ),

          Text( message.title, style: textStyles.titleMedium, ),
          Text( message.body ),

          const Divider(),
          Text( message.data.toString()),

        ],
      ),
    );
  }
}