import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

class LocalNotify {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initPackage() async {
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(
            android: AndroidInitializationSettings(
          '@mipmap/ic_launcher',
        )),
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse);
  }

  void _onDidReceiveNotificationResponse(NotificationResponse details) {
    if (details.payload != null && details.payload!.isNotEmpty) {
      print('${details.payload}');
    }
  }

  Future<NotificationDetails> myNotificationdetail() async {
    AndroidNotificationDetails anD = await AndroidNotificationDetails(
      "channel-Id1",
      "channel-Name",
      channelDescription: 'channel-Description',
      playSound: false,
      priority: Priority.max,
      importance: Importance.max,
    );

    return NotificationDetails(android: anD);
  }

  Future<void> showMyNotification(
      {required int id, required String title, required String body}) async {
    final details = await myNotificationdetail();
    await flutterLocalNotificationsPlugin.show(id, title, body, details);
  }

  Future<void> pshowMyNotification(
      {required int id,
      required String title,
      required String body,
      required String payload1}) async {
    final details = await myNotificationdetail();
    await flutterLocalNotificationsPlugin.show(id, title, body, details,
        payload: payload1);
  }
}
