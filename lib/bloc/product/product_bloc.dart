import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:setup_project/repositry/UserRepository.dart';

import '../../error/exception_handler.dart';
import '../../model/productr_res.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final UserRepository productRepository;
  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<GetProductEvent>(
            (GetProductEvent event, Emitter<ProductState> emit) async {
          emit(ProductLoadingState());
          try {
            final products = await productRepository.getProduct();
            if (products.isEmpty) {
              emit(ProductEmptyState());
            } else {
              emit(ProductLoadedState(products: products));
            }
          } catch (e) {
            final message = handleExceptionWithMessage(e);
            emit(ProductLoadingFailedState(errorMessage: message));
          }
        });
  }
}
