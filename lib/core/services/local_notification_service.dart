import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:astha_engineering/core/utils/logger.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosInitializationSettings = DarwinInitializationSettings();

    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        AppLogger.info('Notification tapped: ${response.payload}');
      },
    );
  }

  static Future<void> showNotification({required int id, required String title, required String body, String? payload}) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'astha_engineering_channel',
      'SafeCheck Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _flutterLocalNotificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
      payload: payload,
    );
  }
}
