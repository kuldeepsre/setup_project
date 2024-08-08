import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;
  final int notificationCount;

  const NotificationScreen({
    Key? key,
    required this.notifications,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications (${notificationCount})'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(notification['title'] ?? 'No Title'),
            subtitle: Text(notification['body'] ?? 'No Body'),
            onTap: () {
              // Handle tap on notification
            },
          );
        },
      ),
    );
  }
}
