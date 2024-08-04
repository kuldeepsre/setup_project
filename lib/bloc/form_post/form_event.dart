part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ClickEvent extends FormEvent {
  final int buttonId;
  ClickEvent(this.buttonId);
}
class ResetPasswordEvent extends FormEvent {
  final int buttonId;
  ResetPasswordEvent(this.buttonId);
}
class SignupEvent extends FormEvent {
  final int buttonId;
  SignupEvent(this.buttonId);
}
class SaveProfileEvent extends FormEvent {
  final int buttonId;
  SaveProfileEvent(this.buttonId);
}
class OtpEvent extends FormEvent {
  final int buttonId;
  OtpEvent(this.buttonId);
}
class SettingEvent extends FormEvent {
  final int buttonId;
  SettingEvent(this.buttonId);
}
class EditProfileEvent extends FormEvent {
  final int buttonId;
  EditProfileEvent(this.buttonId);
}