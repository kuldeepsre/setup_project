import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/product_data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

// BLoC
class CartBloc extends Bloc<CartEvent, CartState> {
  List<Product> _cartItems = [];

  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) {
      _cartItems.add(event.product);
      emit(CartLoaded(List.from(_cartItems)));
    });

    on<RemoveFromCart>((event, emit) {
      _cartItems.remove(event.product);
      emit(CartLoaded(List.from(_cartItems)));
    });

    on<ClearCart>((event, emit) {
      _cartItems.clear();
      emit(CartLoaded(List.from(_cartItems)));
    });
  }
}
