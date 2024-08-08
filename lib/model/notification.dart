class NotificationModel {
  final String title;
  final String body;
  final String count;
  final DateTime timestamp;

  NotificationModel({
    required this.title,
    required this.body,
    required this.timestamp,
    required this.count,
  });
}