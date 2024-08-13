part of 'product_bloc.dart';
// Event
abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductEvent {}

// State
abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

