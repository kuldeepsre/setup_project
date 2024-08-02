import 'package:equatable/equatable.dart';

class BottomNavigationState extends Equatable {
  final int selectedIndex;

  BottomNavigationState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
