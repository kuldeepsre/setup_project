
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:setup_project/model/product_data.dart';
class ProductRepository {
  final String apiUrl = 'https://dummyjson.com/products';
    Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> productsJson = data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}