part of 'form_bloc.dart';

abstract class FormState extends Equatable {
  @override
  List<Object> get props => [];
}

class FormInitial extends FormState {}

class  FormLoading extends FormState {}

class FormSuccess extends FormState {
  final String msg;
  FormSuccess({required this.msg});
}

class  FormFailure extends FormState {
  final String error;

  FormFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class TokenExpired extends FormState {
  final String msg;
  TokenExpired({required this.msg});
}
class NoInternetConnection extends FormState {}