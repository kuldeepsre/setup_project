import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final String? payload;
  final int notificationCount;

  NotificationScreen({
    this.payload,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (payload != null)
              Text(
                'Notification Payload: $payload',
                textAlign: TextAlign.center,
              ),
            Text(
              'Current Notification Count: $notificationCount',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
