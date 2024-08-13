import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/product_data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

// BLoC
// BLoC
class CartBloc extends Bloc<CartEvent, CartState> {
  final Map<Product, int> _cartItems = {};

  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) {
      if (_cartItems.containsKey(event.product)) {
        _cartItems[event.product] = (_cartItems[event.product] ?? 0) + 1;
      } else {
        _cartItems[event.product] = 1;
      }
      emit(CartLoaded(Map.from(_cartItems)));
    });

    on<RemoveFromCart>((event, emit) {
      _cartItems.remove(event.product);
      emit(CartLoaded(Map.from(_cartItems)));
    });

    on<IncrementQuantity>((event, emit) {
      if (_cartItems.containsKey(event.product)) {
        _cartItems[event.product] = (_cartItems[event.product] ?? 0) + 1;
        emit(CartLoaded(Map.from(_cartItems)));
      }
    });

    on<DecrementQuantity>((event, emit) {
      if (_cartItems.containsKey(event.product)) {
        if (_cartItems[event.product]! > 1) {
          _cartItems[event.product] = (_cartItems[event.product] ?? 0) - 1;
        } else {
          _cartItems.remove(event.product);
        }
        emit(CartLoaded(Map.from(_cartItems)));
      }
    });

    on<ClearCart>((event, emit) {
      _cartItems.clear();
      emit(CartLoaded(Map.from(_cartItems)));
    });
  }
}
