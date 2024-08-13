import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String sku;
  final String title;
  final String description;
  final double price;
  Product({required this.sku, required this.title, required this.price, required this.description});

  @override
  List<Object?> get props => [sku, title, price,description];

  // Factory method for creating a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sku: json['sku'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
    );
  }

  // Method to convert Product to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'sku': sku,
      'title': title,
      'price': price,
      'description': description,
    };
  }
}