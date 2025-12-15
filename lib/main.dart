import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'services/notification_service.dart';
import 'services/firebase_service.dart';
import 'services/database_service.dart';
import 'models/notification_model.dart';

// IMPORTANTE: Handler para notificaciones en background/terminated
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
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

  // Mostrar notificación local
  final notificationService = NotificationService();
  await notificationService.initialize();
  await notificationService.showFirebaseNotification(
    id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title: title,
    body: body,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Registrar el handler de background ANTES de runApp
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

  // Inicializar servicios
  final notificationService = NotificationService();
  await notificationService.initialize();

  final firebaseService = FirebaseService();
  await firebaseService.initialize();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _setupNotificationClickHandler();
    _checkInitialMessage();
  }

  // Manejar clics en notificaciones
  void _setupNotificationClickHandler() {
    _notificationService.registerNotificationClickCallback((payload) {
      debugPrint('Notificación clickeada con payload: $payload');
      
      // Navegar a la pantalla de historial cuando se hace clic en una notificación
      navigatorKey.currentState?.pushNamed(AppRoutes.notifications);
    });
  }

  // Verificar si la app se abrió desde una notificación (estado terminated)
  Future<void> _checkInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      debugPrint('App abierta desde notificación en estado TERMINATED');
      
      // Esperar a que el widget tree esté construido
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigatorKey.currentState?.pushNamed(AppRoutes.notifications);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Notifications',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}