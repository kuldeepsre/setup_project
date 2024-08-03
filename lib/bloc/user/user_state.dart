part of 'user_bloc.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}
class UserDataLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded(this.users);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
class UserLoad extends UserState {
  final List<User> users;
  final bool hasReachedMax;

  UserLoad(this.users, {this.hasReachedMax = false});
}