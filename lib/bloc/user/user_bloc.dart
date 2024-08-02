import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/user_response.dart';
import '../../repositry/UserRepository.dart';

part 'user_event.dart';
part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc() : super(UserInitial()) {
//     on<UserEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    // Handle LoadUsers event
    on<LoadUsers>((event, emit) async {
      emit(UserLoading()); // Set state to loading

      try {
        // Fetch users from repository
        final users = await userRepository.getUsers();
        emit(UserLoaded(users)); // Set state to loaded with users
      } catch (e) {
        emit(UserError(e.toString())); // Set state to error
      }
    });
  }
}
