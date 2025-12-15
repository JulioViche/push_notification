import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/notification_list_screen.dart';
import '../screens/notification_detail_screen.dart';
import '../screens/scheduled_notification_screen.dart';

class AppRoutes {
  // Nombres de las rutas
  static const String home = '/';
  static const String notifications = '/notifications';
  static const String notificationDetail = '/notification-detail';
  static const String schedule = '/schedule';

  // Mapa de rutas
  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomeScreen(),
        notifications: (context) => const NotificationListScreen(),
        notificationDetail: (context) => const NotificationDetailScreen(),
        schedule: (context) => const ScheduledNotificationScreen(),
      };

  // Manejo de rutas no encontradas
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case notifications:
        return MaterialPageRoute(builder: (context) => const NotificationListScreen());
      case notificationDetail:
        return MaterialPageRoute(
          builder: (context) => const NotificationDetailScreen(),
          settings: settings,
        );
      case schedule:
        return MaterialPageRoute(builder: (context) => const ScheduledNotificationScreen());
      default:
        return null;
    }
  }
}
