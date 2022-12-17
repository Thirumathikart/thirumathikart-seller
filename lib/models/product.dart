import 'dart:io';

class Product {
  String? name;
  String? price;
  String? category;
  String? description;
  String? quantity;
  File? image;
  String? imageUrl;
  Product(
      {this.name,
      this.price,
      this.category,
      this.description,
      this.quantity,
      this.imageUrl,
      this.image});
}
