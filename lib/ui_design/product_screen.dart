import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc/product_bloc.dart';
import '../repositry/PRODUCT_REPOSITORY.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
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

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search products',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        context.read<ProductBloc>().add(ClearSearch());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
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
      body:BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
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
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No products available'));
        },
      ),

    );
  }
}
