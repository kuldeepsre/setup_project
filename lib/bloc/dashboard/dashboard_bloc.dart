import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState(0)) {
    on<PageChanged>((event, emit) {
      // Emit a new state with the updated index
      emit(BottomNavigationState(event.index));
    });
  }
}