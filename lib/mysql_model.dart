// product.dart

class Product {
  final int id;
  final String cat;
  final String image;
  final String name; // <--- The data you need
  final String unit; // <--- The data you need
  final String price; // <--- The data you need

  Product({
    required this.id,
    required this.cat,
    required this.image,
    required this.name,
    required this.unit,
    required this.price,
  });

  // Factory constructor to create a Product from a JSON map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      // Ensure data types match (e.g., if 'id' is a string in JSON, 
      // you might need to use int.parse(json['id']) or check your PHP
      id: int.parse(json['id']), 
      cat: json['cat'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      price: json['price'] as String,
    );
  }
}