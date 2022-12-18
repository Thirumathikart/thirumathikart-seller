import 'dart:convert';

List<ProductResponse> productResponseFromJson(String str) =>
    // ignore: unnecessary_lambdas
    (json.decode(str) as List).map((i) => ProductResponse.fromJson(i)).toList();

String productResponseToJson(List<ProductResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponse {
  ProductResponse({
    this.id,
    this.productId,
    this.product,
    this.imageUrl,
  });

  int? id;
  int? productId;
  Product? product;
  String? imageUrl;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        id: json['ID'],
        productId: json['ProductID'],
        product: Product.fromJson(json['Product']),
        imageUrl: json['ImageURL'],
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'ProductID': productId,
        'Product': product!.toJson(),
        'ImageURL': imageUrl,
      };
}

class Product {
  Product({
    this.id,
    this.title,
    this.categoryId,
    this.sellerId,
    this.price,
    this.description,
    this.stock,
  });

  int? id;
  String? title;
  int? categoryId;
  int? sellerId;
  int? price;
  String? description;
  int? stock;
  int? quantity = 0;
  String? sellerDetails = 'Seller Details';

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['ID'],
        title: json['Title'],
        categoryId: json['CategoryID'],
        sellerId: json['SellerID'],
        price: json['Price'],
        description: json['Description'],
        stock: json['Stock'],
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Title': title,
        'CategoryID': categoryId,
        'SellerID': sellerId,
        'Price': price,
        'Description': description,
        'Stock': stock,
      };
}
