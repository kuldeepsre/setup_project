import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Routes/route_generator.dart';
import '../main.dart';

import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart'; // Ensure you have this dependency

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: "This channel is used for important notifications",
    importance: Importance.defaultImportance,
    playSound: true,
  );
  final localNotification = FlutterLocalNotificationsPlugin();
  int _notificationCount = 0;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      RoutePaths.NotificationScreen,
      arguments: {
        'payload': message.notification?.body,
        'notificationCount': _notificationCount,
      },
    );
  }

  Future<void> _incrementBadgeCount() async {
    _notificationCount++;
    print('Incrementing badge count to $_notificationCount');  // Debugging line
    FlutterAppBadger.updateBadgeCount(_notificationCount);
  }

  Future<void> terminateNotification(RemoteMessage? message) async {
    if (message == null) return;

    // Handle the notification data or navigate to a specific screen
    print("Handling terminated notification: ${message.notification?.title}");
    navigatorKey.currentState?.pushNamed(
      RoutePaths.NotificationScreen,
      arguments: {
        'payload': message.notification?.body,
        'notificationCount': _notificationCount,
      },
    );
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle notifications that launch the app
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      terminateNotification(message);
    });

    // Handle notifications while the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Handle background notifications
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      final data = message.data;
      print("Title: ${notification?.title}");
      print("Body: ${notification?.body}");
      print("Payload: $data");

      final android = message.notification?.android;
      if (notification != null && android != null) {
        localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: '@mipmap/ic_launcher',
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
        _incrementBadgeCount();
      }
    });
  }

  Future initLocalNotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async {
        if (payload != null) {
          navigatorKey.currentState?.pushNamed(
            RoutePaths.NotificationScreen,
            arguments: {
              'payload': payload.toString(),
              'notificationCount': _notificationCount,
            },
          );
        }
        FlutterAppBadger.removeBadge();
        _notificationCount = 0;
        print('Removed badge count to $_notificationCount');  // Debugging line
      },
    );

    final platform = localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(channel);
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
    initPushNotification();
    initLocalNotification();
  }
}
