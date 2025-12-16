import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'notification_detail_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // 1. Agregamos la notificación
  void firebaseMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    if (kDebugMode) {
      print('Token: $token');
    }

    // 2. Notificaciones en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? "N/A";
      final body = message.notification?.body ?? "N/A";

      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(
            body,
            maxLines: 1,
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
          actions:[
            TextButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>NotificationDetailPage(title: title, body: body)));
              },
              child: Text("Next"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        ),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      final title=message.notification?.title ?? "N/A";
      final body=message.notification?.body ?? "N/A";
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
              (context)=>NotificationDetailPage(title: title, body: body)
          )
        );
    });

    FirebaseMessaging.instance.getInitialMessage().then((message){
      //verificamos si el mensaje no es null
      if (message != null){
        final title=message.notification?.title ?? "N/A";
        final body=message.notification?.body ?? "N/A";
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
              (context)=>NotificationDetailPage(title: title, body: body)
          )
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    firebaseMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
