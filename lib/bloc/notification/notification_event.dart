part of 'notification_bloc.dart';


// Define notification events
abstract class NotificationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NotificationReceived extends NotificationEvent {
  final String title;
  final String body;

  NotificationReceived(this.title, this.body);

  @override
  List<Object> get props => [title, body];
}