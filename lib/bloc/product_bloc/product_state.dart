part of 'product_bloc.dart';
// Event
class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
class ProductSearchResults extends ProductState {
  final List<Product> products;

  ProductSearchResults(this.products);

  @override
  List<Object?> get props => [products];
}

