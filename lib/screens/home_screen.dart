import 'package:flutter/material.dart';
import '../services/notification_service.dart';
import '../services/firebase_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotificationService _notificationService = NotificationService();
  final FirebaseService _firebaseService = FirebaseService();

  int _notificationId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notifications'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
            tooltip: 'Ver historial',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card con información del token
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'FCM Token:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SelectableText(
                      _firebaseService.fcmToken ?? 'No disponible',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Título de notificaciones locales
            const Text(
              'Notificaciones Locales',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Botón: Notificación instantánea
            ElevatedButton.icon(
              onPressed: _showInstantNotification,
              icon: const Icon(Icons.notifications),
              label: const Text('Mostrar Notificación Instantánea'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 12),

            // Botón: Notificación con botones
            ElevatedButton.icon(
              onPressed: _showNotificationWithButtons,
              icon: const Icon(Icons.touch_app),
              label: const Text('Notificación con Botones'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 12),

            // Botón: Programar notificación
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/schedule');
              },
              icon: const Icon(Icons.schedule),
              label: const Text('Programar Notificación'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 24),

            // Título de historial
            const Text(
              'Historial y Configuración',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Botón: Ver historial
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
              icon: const Icon(Icons.history),
              label: const Text('Ver Historial de Notificaciones'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 12),

            // Botón: Cancelar todas las notificaciones programadas
            OutlinedButton.icon(
              onPressed: _cancelAllNotifications,
              icon: const Icon(Icons.cancel),
              label: const Text('Cancelar Notificaciones Programadas'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mostrar notificación instantánea
  void _showInstantNotification() {
    _notificationId++;
    _notificationService.showInstantNotification(
      id: _notificationId,
      title: 'Notificación Instantánea #$_notificationId',
      body: 'Esta es una notificación local instantánea generada en ${DateTime.now().hour}:${DateTime.now().minute}',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notificación instantánea enviada'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Mostrar notificación con botones
  void _showNotificationWithButtons() {
    _notificationId++;
    _notificationService.showNotificationWithButtons(
      id: _notificationId,
      title: 'Acción Requerida #$_notificationId',
      body: 'Presiona Aceptar o Rechazar en la notificación',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notificación con botones enviada'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Cancelar todas las notificaciones
  void _cancelAllNotifications() async {
    await _notificationService.cancelAllNotifications();
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Todas las notificaciones programadas canceladas'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
