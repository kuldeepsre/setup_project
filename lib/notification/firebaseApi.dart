import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Routes/route_generator.dart';
import '../bloc/notification/notification_bloc.dart';
import '../main.dart';

import 'package:flutter_app_badger/flutter_app_badger.dart';

import '../main.dart';
import '../main.dart';
import '../main.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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

  Future<void> initNotification() async {
    await Firebase.initializeApp();

    await localNotification.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        final String? payload = response.payload;
        if (payload != null) {
          _navigateToNotificationScreenFromPayload(payload);
        }
      },
    );

    final platform = localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? 'No Title';
      final body = message.notification?.body ?? 'No Body';
      final data = message.data;

      _showLocalNotification(title, body, jsonEncode(data));
      _incrementBadgeCount();

      // Add notification to BLoC
      final bloc = BlocProvider.of<NotificationBloc>(navigatorKey.currentContext!);
      bloc.add(NotificationReceived(title, body));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationNavigation(message);
    });

    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationNavigation(initialMessage);
    }
  }

  Future<void> _showLocalNotification(String title, String body, String payload) async {
    await localNotification.show(
      0,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      payload: payload,
    );
  }

  Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    _handleNotificationNavigation(message);
  }

  void _handleNotificationNavigation(RemoteMessage message) {
    final title = message.notification?.title ?? 'No Title';
    final body = message.notification?.body ?? 'No Body';
    final payload = jsonEncode(message.data);

    final bloc = BlocProvider.of<NotificationBloc>(navigatorKey.currentContext!);
     bloc.add(NotificationReceived(title, body));

    navigatorKey.currentState?.pushNamed(
      RoutePaths.NotificationScreen,
      arguments: {
        'notifications': bloc.state is NotificationsLoaded ? (bloc.state as NotificationsLoaded).notifications : [],
        'notificationCount': _notificationCount,
      },
    );
  }

  void _navigateToNotificationScreenFromPayload(String payload) {
    final data = jsonDecode(payload) as Map<String, dynamic>;
    final bloc = BlocProvider.of<NotificationBloc>(navigatorKey.currentContext!);

    navigatorKey.currentState?.pushNamed(
      RoutePaths.NotificationScreen,
      arguments: {
        'notifications': bloc.state is NotificationsLoaded ? (bloc.state as NotificationsLoaded).notifications : [],
        'notificationCount': _notificationCount,
      },
    );
  }

  Future<void> _incrementBadgeCount() async {
    _notificationCount++;
    FlutterAppBadger.updateBadgeCount(_notificationCount);
  }
}
