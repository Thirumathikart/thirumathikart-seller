import 'dart:convert';

UpdateProductRequest updateProductRequestFromJson(String str) =>
    UpdateProductRequest.fromJson(json.decode(str));

String updateProductRequestToJson(UpdateProductRequest data) =>
    json.encode(data.toJson());

class UpdateProductRequest {
  UpdateProductRequest({
    required this.id,
    required this.categoryId,
    required this.price,
    required this.stock,
    required this.title,
    required this.description,
  });

  final int id;
  final int categoryId;
  final int price;
  final int stock;
  final String title;
  final String description;

  factory UpdateProductRequest.fromJson(Map<String, dynamic> json) =>
      UpdateProductRequest(
        id: json['id'],
        categoryId: json['category_id'],
        price: json['price'],
        stock: json['stock'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'price': price,
        'stock': stock,
        'title': title,
        'description': description,
      };
}
