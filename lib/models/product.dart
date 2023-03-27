import 'dart:io';

class Product {
  String? name;
  String? price;
  String? category;
  String? description;
  String? quantity;
  String? productWeight;
  File? image;
  String? imageUrl;
  Product(
      {this.name,
      this.price,
      this.category,
      this.description,
      this.quantity,
      this.productWeight,
      this.imageUrl,
      this.image});
}
