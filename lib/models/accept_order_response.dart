// To parse this JSON data, do
//
//     final acceptOrderResponse = acceptOrderResponseFromJson(jsonString);

import 'dart:convert';

AcceptOrderResponse acceptOrderResponseFromJson(String str) =>
    AcceptOrderResponse.fromJson(json.decode(str));

String acceptOrderResponseToJson(AcceptOrderResponse data) =>
    json.encode(data.toJson());

class AcceptOrderResponse {
  AcceptOrderResponse({
    this.response,
  });

  String? response;

  factory AcceptOrderResponse.fromJson(Map<String, dynamic> json) =>
      AcceptOrderResponse(
        response: json['response'],
      );

  Map<String, dynamic> toJson() => {
        'response': response,
      };
}
