import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/notification_service.dart';

class ScheduledNotificationScreen extends StatefulWidget {
  const ScheduledNotificationScreen({super.key});

  @override
  State<ScheduledNotificationScreen> createState() => _ScheduledNotificationScreenState();
}

class _ScheduledNotificationScreenState extends State<ScheduledNotificationScreen> {
  final NotificationService _notificationService = NotificationService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  
  DateTime _selectedDate = DateTime.now().add(const Duration(minutes: 1));
  TimeOfDay _selectedTime = TimeOfDay.now();
  
  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programar Notificación'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                hintText: 'Ingresa el título de la notificación',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
              maxLength: 50,
            ),
            const SizedBox(height: 16),

            // Mensaje
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'Mensaje',
                hintText: 'Ingresa el mensaje de la notificación',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.message),
              ),
              maxLines: 3,
              maxLength: 200,
            ),
            const SizedBox(height: 24),

            // Sección de fecha y hora
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fecha y Hora de Envío',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Selector de fecha
                    ListTile(
                      leading: const Icon(Icons.calendar_today, color: Colors.orange),
                      title: const Text('Fecha'),
                      subtitle: Text(
                        DateFormat('dd/MM/yyyy').format(_selectedDate),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: _selectDate,
                    ),
                    const Divider(),

                    // Selector de hora
                    ListTile(
                      leading: const Icon(Icons.access_time, color: Colors.orange),
                      title: const Text('Hora'),
                      subtitle: Text(
                        _selectedTime.format(context),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: _selectTime,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Resumen
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 165, 0, 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.orange),
                      SizedBox(width: 8),
                      Text(
                        'Resumen',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'La notificación se enviará el ${DateFormat('dd/MM/yyyy').format(_selectedDate)} a las ${_selectedTime.format(context)}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getTimeRemaining(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Botón de programar
            ElevatedButton.icon(
              onPressed: _scheduleNotification,
              icon: const Icon(Icons.schedule_send),
              label: const Text('Programar Notificación'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  String _getTimeRemaining() {
    final scheduledDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    final difference = scheduledDateTime.difference(DateTime.now());

    if (difference.isNegative) {
      return 'La fecha seleccionada ya pasó';
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;

    if (days > 0) {
      return 'Falta: $days día(s), $hours hora(s) y $minutes minuto(s)';
    } else if (hours > 0) {
      return 'Falta: $hours hora(s) y $minutes minuto(s)';
    } else {
      return 'Falta: $minutes minuto(s)';
    }
  }

  void _scheduleNotification() async {
    // Validar campos
    if (_titleController.text.trim().isEmpty) {
      _showError('Por favor ingresa un título');
      return;
    }

    if (_bodyController.text.trim().isEmpty) {
      _showError('Por favor ingresa un mensaje');
      return;
    }

    // Crear fecha y hora completa
    final scheduledDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    // Validar que la fecha no sea en el pasado
    if (scheduledDateTime.isBefore(DateTime.now())) {
      _showError('La fecha y hora seleccionada ya pasó');
      return;
    }

    try {
      // Programar la notificación
      await _notificationService.scheduleNotification(
        id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        title: _titleController.text.trim(),
        body: _bodyController.text.trim(),
        scheduledDate: scheduledDateTime,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Notificación programada para ${DateFormat('dd/MM/yyyy HH:mm').format(scheduledDateTime)}',
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );

        // Limpiar campos
        _titleController.clear();
        _bodyController.clear();
        
        // Volver a la pantalla anterior
        Navigator.pop(context);
      }
    } catch (e) {
      _showError('Error al programar la notificación: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
