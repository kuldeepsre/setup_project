import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc/cart/cart_bloc.dart';
import 'CheckoutScreen.dart';
// Import your Product model class here

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return Center(child: Text('Your cart is empty.'));
          } else if (state is CartLoaded) {
            final cartItems = state.cartItems;
            if (cartItems.isEmpty) {
              return Center(child: Text('Your cart is empty.'));
            }
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems.keys.elementAt(index);
                final quantity = cartItems[product]!;
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          context.read<CartBloc>().add(DecrementQuantity(product));
                        },
                      ),
                      Text('$quantity'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          context.read<CartBloc>().add(IncrementQuantity(product));
                        },
                      ),
                      Text('\$${(product.price * quantity).toStringAsFixed(2)}'),
                    ],
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveFromCart(product));
                    },
                  ),
                );
              },
            );
          } else if (state is CartError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('Something went wrong.'));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                final totalAmount = state is CartLoaded
                    ? state.cartItems.entries.fold(
                    0.0, (sum, entry) => sum + (entry.key.price * entry.value))
                    : 0.0;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Checkout screen or handle checkout logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(),
                  ),
                );
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
