import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {
  final String? payload;
  final int notificationCount;

  const NotificationScreen({
    Key? key,
    this.payload,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Payload: ${payload ?? 'No data'}'),
            Text('Notification Count: $notificationCount'),
          ],
        ),
      ),
    );
  }
}