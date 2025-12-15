import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import '../models/notification_model.dart';
import 'database_service.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final DatabaseService _databaseService = DatabaseService();

  // Stream para manejar clics en notificaciones
  final _notificationClickController = <String, Function(String?)>{};

  Future<void> initialize() async {
    // Inicializar timezone
    tz.initializeTimeZones();

    // Configuración para Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Configuración para iOS (opcional)
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    // Solicitar permisos para Android 13+
    await _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await androidImplementation?.requestNotificationsPermission();
    await androidImplementation?.requestExactAlarmsPermission();
  }

  // Callback cuando se hace clic en la notificación
  void _onNotificationTap(NotificationResponse response) {
    final String? payload = response.payload;
    
    if (payload != null && _notificationClickController.containsKey('default')) {
      _notificationClickController['default']!(payload);
    }

    // Manejar clics en botones de acción
    if (response.actionId != null) {
      if (response.actionId == 'accept') {
        debugPrint('Usuario aceptó la notificación');
      } else if (response.actionId == 'reject') {
        debugPrint('Usuario rechazó la notificación');
      }
    }
  }

  // Registrar callback para manejar clics
  void registerNotificationClickCallback(Function(String?) callback) {
    _notificationClickController['default'] = callback;
  }

  // Mostrar notificación inmediata
  Future<void> showInstantNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'instant_channel',
      'Notificaciones Instantáneas',
      channelDescription: 'Notificaciones inmediatas sin programación',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: 'instant_$id',
    );

    // Guardar en base de datos
    await _databaseService.insertNotification(
      NotificationModel(
        title: title,
        body: body,
        timestamp: DateTime.now(),
        type: 'local',
      ),
    );
  }

  // Mostrar notificación con botones de acción
  Future<void> showNotificationWithButtons({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'action_channel',
      'Notificaciones con Acciones',
      channelDescription: 'Notificaciones con botones de acción',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'accept',
          'Aceptar',
          icon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
          showsUserInterface: true,
        ),
        AndroidNotificationAction(
          'reject',
          'Rechazar',
          icon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
          cancelNotification: true,
        ),
      ],
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: 'action_$id',
    );

    // Guardar en base de datos
    await _databaseService.insertNotification(
      NotificationModel(
        title: title,
        body: body,
        timestamp: DateTime.now(),
        type: 'local',
      ),
    );
  }

  // Programar notificación para una fecha/hora específica
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'scheduled_channel',
      'Notificaciones Programadas',
      channelDescription: 'Notificaciones programadas para fecha/hora específica',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'scheduled_$id',
    );

    // Guardar en base de datos
    await _databaseService.insertNotification(
      NotificationModel(
        title: title,
        body: body,
        timestamp: scheduledDate,
        type: 'scheduled',
      ),
    );

    debugPrint('Notificación programada para: $scheduledDate');
  }

  // Cancelar notificación programada
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  // Cancelar todas las notificaciones
  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  // Obtener notificaciones pendientes
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  // Mostrar notificación desde Firebase (para consistencia)
  Future<void> showFirebaseNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'firebase_channel',
      'Notificaciones Firebase',
      channelDescription: 'Notificaciones recibidas desde Firebase',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: 'firebase_$id',
    );

    // Guardar en base de datos
    await _databaseService.insertNotification(
      NotificationModel(
        title: title,
        body: body,
        timestamp: DateTime.now(),
        type: 'remote',
      ),
    );
  }
}
