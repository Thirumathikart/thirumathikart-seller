// To parse this JSON data, do
//
//     final fetchOrderResponses = fetchOrderResponsesFromJson(jsonString);

// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

FetchOrderResponses fetchOrderResponsesFromJson(String str) =>
    FetchOrderResponses.fromJson(json.decode(str));

String fetchOrderResponsesToJson(FetchOrderResponses data) =>
    json.encode(data.toJson());

class FetchOrderResponses {
  FetchOrderResponses({
    this.fetchOrderResponse,
  });

  List<FetchOrderResponse>? fetchOrderResponse;

  factory FetchOrderResponses.fromJson(Map<String, dynamic> json) =>
      FetchOrderResponses(
        fetchOrderResponse: List<FetchOrderResponse>.from(
            json['response'].map((x) => FetchOrderResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'response':
            List<dynamic>.from(fetchOrderResponse!.map((x) => x.toJson())),
      };
}

class FetchOrderResponse {
  FetchOrderResponse({
    this.order,
    this.items,
  });

  Order? order;
  List<Item>? items;

  factory FetchOrderResponse.fromJson(Map<String, dynamic> json) =>
      FetchOrderResponse(
        order: Order.fromJson(json['order']),
        items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'order': order!.toJson(),
        'items': List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.order,
    this.orderId,
    this.name,
    this.categoryId,
    this.description,
    this.quantity,
    this.price,
  });

  int? id;
  Order? order;
  int? orderId;
  String? name;
  int? categoryId;
  String? description;
  int? quantity;
  int? price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['ID'],
        order: Order.fromJson(json['Order']),
        orderId: json['OrderID'],
        name: json['Name'],
        categoryId: json['CategoryID'],
        description: json['Description'],
        quantity: json['Quantity'],
        price: json['Price'],
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Order': order!.toJson(),
        'OrderID': orderId,
        'Name': name,
        'CategoryID': categoryId,
        'Description': description,
        'Quantity': quantity,
        'Price': price,
      };
}

class Order {
  Order({
    this.id,
    this.customerId,
    this.customerAddressId,
    this.sellerId,
    this.sellerAddressId,
    this.deliveryPartnerId,
    this.orderStatus,
  });

  int? id;
  int? customerId;
  int? customerAddressId;
  int? sellerId;
  int? sellerAddressId;
  int? deliveryPartnerId;
  String? orderStatus;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['ID'],
        customerId: json['CustomerID'],
        customerAddressId: json['CustomerAddressID'],
        sellerId: json['SellerID'],
        sellerAddressId: json['SellerAddressID'],
        deliveryPartnerId: json['DeliveryPartnerID'],
        orderStatus: json['OrderStatus'],
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'CustomerID': customerId,
        'CustomerAddressID': customerAddressId,
        'SellerID': sellerId,
        'SellerAddressID': sellerAddressId,
        'DeliveryPartnerID': deliveryPartnerId,
        'OrderStatus': orderStatus,
      };
}
