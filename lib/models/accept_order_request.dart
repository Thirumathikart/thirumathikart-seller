// To parse this JSON data, do
//
//     final acceptOrderRequest = acceptOrderRequestFromJson(jsonString);

import 'dart:convert';

AcceptOrderRequest acceptOrderRequestFromJson(String str) =>
    AcceptOrderRequest.fromJson(json.decode(str));

String acceptOrderRequestToJson(AcceptOrderRequest data) =>
    json.encode(data.toJson());

class AcceptOrderRequest {
  AcceptOrderRequest({
    this.orderId,
  });

  int? orderId;

  factory AcceptOrderRequest.fromJson(Map<String, dynamic> json) =>
      AcceptOrderRequest(
        orderId: json['order_id'],
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
      };
}
