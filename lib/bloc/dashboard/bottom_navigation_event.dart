import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PageChanged extends BottomNavigationEvent {
  final int index;

  PageChanged(this.index);

  @override
  List<Object> get props => [index];
}
