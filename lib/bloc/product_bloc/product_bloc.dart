import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/product_data.dart';
import '../../repositry/PRODUCT_REPOSITORY.dart';

part 'product_event.dart';
part 'product_state.dart';


// BLoC
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  List<Product> _allProducts = [];

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await productRepository.fetchProducts();
        _allProducts = products;  // Store all products for searching and filtering
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<SearchProducts>((event, emit) {
      final query = event.query.toLowerCase();
      final results = _allProducts.where((product) {
        return product.title.toLowerCase().contains(query) ||
            product.description.toLowerCase().contains(query);
      }).toList();
      emit(ProductSearchResults(results));
    });

    on<FilterByPrice>((event, emit) {
      final minPrice = event.minPrice;
      final maxPrice = event.maxPrice;
      final filteredProducts = _allProducts.where((product) {
        return product.price >= minPrice && product.price <= maxPrice;
      }).toList();
      emit(ProductSearchResults(filteredProducts));
    });

    on<ClearSearch>((event, emit) {
      emit(ProductLoaded(_allProducts));
    });
  }
}