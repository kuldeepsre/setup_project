import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup_project/ui_design/CartScreen.dart';

import '../bloc/product_bloc/cart/cart_bloc.dart';
import '../bloc/product_bloc/product_bloc.dart';
import '../repositry/PRODUCT_REPOSITORY.dart';
class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController _searchController = TextEditingController();
  double _minPrice = 0;
  double _maxPrice = 1000;
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      final query = _searchController.text;
      if (query.isEmpty) {
        context.read<ProductBloc>().add(ClearSearch());
      } else {
        context.read<ProductBloc>().add(SearchProducts(query));
      }
    });
  }
  void _applyPriceFilter() {
    context.read<ProductBloc>().add(FilterByPrice(_minPrice, _maxPrice));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Products'),
        actions: [
      /*    BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int cartCount = 0;
              if (state is CartLoaded) {
                cartCount = state.cartItems.length;
              }
              return IconButton(
                icon: Stack(
                  children: [
                    const Icon(Icons.shopping_cart,color: Colors.green,),
                    if (cartCount > 0)
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            cartCount.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
              );
            },
          ),*/
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search products',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        context.read<ProductBloc>().add(ClearSearch());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text('Min Price: \$${_minPrice.toStringAsFixed(2)}'),
                    ),
                    Expanded(
                      child: Text('Max Price: \$${_maxPrice.toStringAsFixed(2)}'),
                    ),
                  ],
                ),
                RangeSlider(
                  min: 0,
                  max: 1000,
                  divisions: 100,
                  values: RangeValues(_minPrice, _maxPrice),
                  onChanged: (values) {
                    setState(() {
                      _minPrice = values.start;
                      _maxPrice = values.end;
                    });
                    _applyPriceFilter();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded || state is ProductSearchResults) {
            final products = state is ProductSearchResults
                ? state.products
                : (state as ProductLoaded).products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: Text('\$${product.price}'),
                  onTap: () {
                    /*      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(product: product),
                      ),
                    );*/
                  },
                  leading: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCart(product));
                    },
                  ),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No products available'));
        },
      ),
    );
  }
}