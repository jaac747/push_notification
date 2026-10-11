# Push Notification

En esta aplicación se muestran las notificaciones recibidas, las almacena dentro del telefono, por lo que no se pierden si se reinicia la aplicación.

## Caracteristicas
La aplicación recibe las notificaciones y las muestra en pantalla.
* Pantalla Principal
* Detalle Notificación
* Notificaciones sin leer y leidas
* Eliminar notificación individual
* Eliminar todas las notificaciones

### Pantalla principal
En esta pantalla se muestran todas las notificaciones recibidas

![This is an alt text.](/assets/readme/1_inicio.png "This is a sample image.")

La aplicación permite recibir notificaciones estando cerrada, y al hacer click redirige a la pantalla de detalles
![This is an alt text.](/assets/readme/2_notificacionappcerrada.png ).

Tambien puede recibir la notificación con la aplicación abierta.
![](/assets/readme/3_notificacionLocal.png)

### Detalle Notificación
Se muestra la información de la notificación tal como su titulo, el mensaje y si trae parametros para alguna configuración, adicional permite eliminar la notificacion de forma individual.

![This is an alt text.](/assets/readme/5_detallesNotif.png "This is a sample image.")

### Notificaciones sin leer y leidas

Al recibir una nueva notificación esta se muestra con un tono mas oscura, indicando que no a sido leido el mensaje.
![This is an alt text.](/assets/readme/4_marcadoSinLeer.png )

Una ves leido, se muestra con el texto mas claro.

![This is an alt text.](/assets/readme/6_appLeida.png)

### Eliminar notificación individual
Al ingresar dentro del mensaje se permite eliminarlo de forma individual.
![This is an alt text.](/assets/readme/7_eliminacionNotif.png )

### Eliminar todas las notificaciones
Tambien se permite eliminar todas las notificaciones  independientemente si han sido leidas o no.
![This is an alt text.](/assets/readme/8_eliminaciontodos.png)


## Tecnologia
Esta aplicación esta realizada con flutter
* Implementa un almacenamiento local con drift
* Local_notifications para notificaciones entrantes
* firebase para recibir los mensajes de la red
* Bloc para administrar todo el comportamiento de visualización y recepción de notificaciones
