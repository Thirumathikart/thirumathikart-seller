import 'dart:convert';

CreateProductRequest createProductRequestFromJson(String str) =>
    CreateProductRequest.fromJson(json.decode(str));

String createProductRequestToJson(CreateProductRequest data) =>
    json.encode(data.toJson());

class CreateProductRequest {
  CreateProductRequest({
    required this.categoryId,
    required this.price,
    required this.stock,
    required this.title,
    required this.description,
  });

  final int categoryId;
  final int price;
  final int stock;
  final String title;
  final String description;

  factory CreateProductRequest.fromJson(Map<String, dynamic> json) =>
      CreateProductRequest(
        categoryId: json['category_id'],
        price: json['price'],
        stock: json['stock'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'price': price,
        'stock': stock,
        'title': title,
        'description': description,
      };
}
