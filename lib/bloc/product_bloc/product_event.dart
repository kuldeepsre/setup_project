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
class SearchProducts extends ProductEvent {
  final String query;

  SearchProducts(this.query);

  @override
  List<Object?> get props => [query];
}
class ClearSearch extends ProductEvent {}
class FilterByPrice extends ProductEvent {
  final double minPrice;
  final double maxPrice;

  FilterByPrice(this.minPrice, this.maxPrice);

  @override
  List<Object?> get props => [minPrice, maxPrice];
}
