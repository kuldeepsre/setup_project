import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../utils/network_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final NetworkService networkService;

  LoginBloc({required this.networkService}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    if (!await networkService.isConnected()) {
      emit(NoInternetConnection());
      return;
    }

    emit(LoginLoading());

    await Future.delayed(Duration(seconds: 2)); // Simulate a network call

    if (event.username == 'user' && event.password == 'password') {
      emit(LoginSuccess(msg: "Login Successfull"));
    } else {
      emit(LoginFailure(error: 'Invalid username or password'));
    }
  }
}