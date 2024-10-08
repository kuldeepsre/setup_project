import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:setup_project/repositry/form_repository/form_repository.dart';

import '../../repositry/UserRepository.dart';

part 'form_event.dart';

part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  final FormRepository postRepository;

  FormBloc(this.postRepository) : super(FormInitial()) {
    on<FormEvent>((event, emit) async {
      if (event is ClickEvent) {
        emit(FormLoading());
        try {
          // Fetch posts from repository
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
    on<FormEvent>((event, emit) async {
      if (event is ResetPasswordEvent) {
        emit(FormLoading());
        try {
          // Fetch posts from repository
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
    on<FormEvent>((event, emit) async {
      if (event is SignupEvent) {
        emit(FormLoading());
        try {
          // Fetch posts from repository
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
    on<FormEvent>((event, emit) async {
      if (event is SaveProfileEvent) {
        emit(FormLoading());
        try {
          // Fetch posts from repository
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
    on<FormEvent>((event, emit) async {
      if (event is OtpEvent) {
        emit(FormLoading());
        try {
          // Fetch posts from repository
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
    on<FormEvent>((event, emit) async {
      if (event is SettingEvent) {
        emit(FormLoading());
        try {
          // Fetch posts from repository
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
    on<FormEvent>((event, emit) async {
      if (event is EditProfileEvent) {
        emit(FormLoading());
        try {
          // Fetch posts from repository
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
    on<FormEvent>((event, emit) async {
      if (event is EditProfileEvent) {
        emit(FormLoading());
        try {
          // form submit
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
    on<FormEvent>((event, emit) async {
      if (event is CartEvent) {
        emit(FormLoading());
        try {
          // form submit
          final posts = await postRepository.FormPosts();
          emit(FormSuccess(msg: "Success")); // Set state to loaded with posts
        } catch (e) {
          emit(FormFailure(error: "$e")); // Set state to error
        }
      }
    });
  }
}
