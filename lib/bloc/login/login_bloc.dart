import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:setup_project/repositry/form_repository/login_repo.dart';

import '../../utils/network_service.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
      emit(LoginLoading());

    try {
      dynamic isLoginSuccessful =
          await loginRepository.login(event.username, event.password);

      if (isLoginSuccessful) {
        emit(LoginSuccess(msg: "Login Successful"));
      } else {
        emit(LoginFailure(error: 'Invalid username or password'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
