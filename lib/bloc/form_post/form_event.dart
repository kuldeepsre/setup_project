part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ClickEvent extends FormEvent {
  final int buttonId;
  ClickEvent(this.buttonId);
}