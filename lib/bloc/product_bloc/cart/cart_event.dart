part of 'cart_bloc.dart';


// Events
abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final Product product;

  AddToCart(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveFromCart extends CartEvent {
  final Product product;

  RemoveFromCart(this.product);

  @override
  List<Object?> get props => [product];
}

class ClearCart extends CartEvent {}

class IncrementQuantity extends CartEvent {
  final Product product;

  IncrementQuantity(this.product);

  @override
  List<Object?> get props => [product];
}

class DecrementQuantity extends CartEvent {
  final Product product;

  DecrementQuantity(this.product);

  @override
  List<Object?> get props => [product];
}
