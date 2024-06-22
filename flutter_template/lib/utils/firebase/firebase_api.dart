import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/pages/noti_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  final androidChannel = const AndroidNotificationChannel(
    "high_importance_channel",
    "High Importance Notifications",
    description: "This channel is used for important notifications",
    importance: Importance.high,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  static void handleMessage(RemoteMessage? message) async {
    if (message == null) {
      print("Inside");
      return;
    }

    if (message.data["url"] == "noti") {
      navigatorKey.currentState?.pushNamed(
        NotiScreen.notiRoute,
        arguments: message,
      );
    }
  }

  static Future<void> handleBgMsg(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    print("Message title: ${message.notification?.title}");
    print("Message body: ${message.notification?.body}");
    print("Message data: ${message.data}");
  }

  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBgMsg);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) {
        return;
      }
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            channelDescription: androidChannel.description,
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initLocalNotifications() async {
    await _localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()!;
    await platform.createNotificationChannel(androidChannel);
  }

  Future<void> initializeFirebaseNotifications() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    final fcmToken = await firebaseMessaging.getToken();
    print("Token $fcmToken");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("fcmToken", fcmToken!);
    initPushNotification();
    initLocalNotifications();
  }

  // Future<String> getFCM() async {
  //   NotificationSettings settings = await firebaseMessaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );

  //   final fcmToken = await firebaseMessaging.getToken();
  //   return fcmToken!;
  // }
}

// Top-level functions for notification responses
void onDidReceiveNotificationResponse(NotificationResponse details) {
  FirebaseApi.handleMessage(
      RemoteMessage.fromMap(jsonDecode(details.payload!)));
}

void onDidReceiveBackgroundNotificationResponse(NotificationResponse details) {
  FirebaseApi.handleMessage(
      RemoteMessage.fromMap(jsonDecode(details.payload!)));
}
