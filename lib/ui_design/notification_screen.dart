import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationScreen extends StatelessWidget {
  final List<RemoteMessage> notifications;
  final int notificationCount;

  NotificationScreen({
    required this.notifications,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Column(
        children: [
          Text('You have $notificationCount notifications'),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  title: Text(notification.notification?.title ?? 'No Title'),
                  subtitle: Text(notification.notification?.body ?? 'No Body'),
                  onTap: () {
                    // Handle notification tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}