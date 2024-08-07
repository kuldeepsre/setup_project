import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final payload = args['payload'] as String?;
    final notificationCount = args['notificationCount'] as int;


    return Scaffold(
      appBar: AppBar(title: Text("Notification Screen")),
      body: Center(
        child: Text('Payload: $payload\nNotification Count: $notificationCount'),
      ),
    );
  }
}
