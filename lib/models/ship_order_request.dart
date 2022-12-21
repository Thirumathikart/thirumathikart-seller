// To parse this JSON data, do
//
//     final shipOrderRequest = shipOrderRequestFromJson(jsonString);

import 'dart:convert';

ShipOrderRequest shipOrderRequestFromJson(String str) =>
    ShipOrderRequest.fromJson(json.decode(str));

String shipOrderRequestToJson(ShipOrderRequest data) =>
    json.encode(data.toJson());

class ShipOrderRequest {
  ShipOrderRequest({
    this.orderId,
  });

  int? orderId;

  factory ShipOrderRequest.fromJson(Map<String, dynamic> json) =>
      ShipOrderRequest(
        orderId: json['order_id'],
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
      };
}
