// To parse this JSON data, do
//
//     final shipOrderResponse = shipOrderResponseFromJson(jsonString);

import 'dart:convert';

ShipOrderResponse shipOrderResponseFromJson(String str) =>
    ShipOrderResponse.fromJson(json.decode(str));

String shipOrderResponseToJson(ShipOrderResponse data) =>
    json.encode(data.toJson());

class ShipOrderResponse {
  ShipOrderResponse({
    this.response,
  });

  String? response;

  factory ShipOrderResponse.fromJson(Map<String, dynamic> json) =>
      ShipOrderResponse(
        response: json['response'],
      );

  Map<String, dynamic> toJson() => {
        'response': response,
      };
}
