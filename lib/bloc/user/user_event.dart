part of 'user_bloc.dart';

abstract class UserEvent {}

class LoadUsers extends UserEvent {}
class LoadUser extends UserEvent {
  final int page;
  final int perPage;

  LoadUser({this.page = 1, this.perPage = 10});
}