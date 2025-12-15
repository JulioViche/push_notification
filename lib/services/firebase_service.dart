import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'notification_service.dart';
import 'database_service.dart';
import '../models/notification_model.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final NotificationService _notificationService = NotificationService();
  final DatabaseService _databaseService = DatabaseService();

  String? _fcmToken;
  String? get fcmToken => _fcmToken;

  // Inicializar Firebase Messaging
  Future<void> initialize() async {
    // Solicitar permisos
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('Usuario autorizó las notificaciones');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      debugPrint('Usuario autorizó provisionalmente');
    } else {
      debugPrint('Usuario denegó los permisos');
    }

    // Obtener token FCM
    _fcmToken = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print('FCM Token: $_fcmToken');
    }

    // Escuchar cambios del token
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      _fcmToken = newToken;
      if (kDebugMode) {
        print('Token actualizado: $newToken');
      }
    });

    // Configurar handlers
    _setupForegroundHandler();
    _setupBackgroundHandler();
    _setupTerminatedHandler();
  }

  // Handler para notificaciones en FOREGROUND (app abierta)
  void _setupForegroundHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('Notificación recibida en FOREGROUND');
      debugPrint('Título: ${message.notification?.title}');
      debugPrint('Cuerpo: ${message.notification?.body}');

      final title = message.notification?.title ?? 'Sin título';
      final body = message.notification?.body ?? 'Sin mensaje';

      // Mostrar notificación local
      await _notificationService.showFirebaseNotification(
        id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        title: title,
        body: body,
      );
    });
  }

  // Handler para notificaciones en BACKGROUND (app en segundo plano)
  void _setupBackgroundHandler() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      debugPrint('Notificación abierta desde BACKGROUND');
      
      final title = message.notification?.title ?? 'Sin título';
      final body = message.notification?.body ?? 'Sin mensaje';

      // Guardar en DB si no está guardada
      await _databaseService.insertNotification(
        NotificationModel(
          title: title,
          body: body,
          timestamp: DateTime.now(),
          type: 'remote',
        ),
      );

      // Aquí puedes navegar a una pantalla específica si es necesario
      // Esto se maneja mejor en el main.dart con el NavigatorKey
    });
  }

  // Handler para cuando la app se abre desde TERMINATED (app cerrada)
  Future<void> _setupTerminatedHandler() async {
    RemoteMessage? initialMessage =
        await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      debugPrint('App abierta desde notificación en estado TERMINATED');
      
      final title = initialMessage.notification?.title ?? 'Sin título';
      final body = initialMessage.notification?.body ?? 'Sin mensaje';

      // Guardar en DB
      await _databaseService.insertNotification(
        NotificationModel(
          title: title,
          body: body,
          timestamp: DateTime.now(),
          type: 'remote',
        ),
      );

      // La navegación se manejará en el main.dart
    }
  }

  // Suscribirse a un tópico
  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    debugPrint('Suscrito al tópico: $topic');
  }

  // Desuscribirse de un tópico
  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    debugPrint('Desuscrito del tópico: $topic');
  }

  // Eliminar token (útil al cerrar sesión)
  Future<void> deleteToken() async {
    await _firebaseMessaging.deleteToken();
    _fcmToken = null;
    debugPrint('Token FCM eliminado');
  }
}

// IMPORTANTE: Esta función DEBE estar fuera de cualquier clase
// Handler para notificaciones en BACKGROUND y TERMINATED
@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  // No inicializar Firebase aquí, ya se hace en el main
  debugPrint('Manejando mensaje en background: ${message.messageId}');
  
  final title = message.notification?.title ?? 'Sin título';
  final body = message.notification?.body ?? 'Sin mensaje';

  // Guardar en base de datos
  final databaseService = DatabaseService();
  await databaseService.insertNotification(
    NotificationModel(
      title: title,
      body: body,
      timestamp: DateTime.now(),
      type: 'remote',
    ),
  );

  // Mostrar notificación local para mantener consistencia
  final notificationService = NotificationService();
  await notificationService.showFirebaseNotification(
    id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title: title,
    body: body,
  );
}
