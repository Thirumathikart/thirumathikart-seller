import 'dart:convert';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse {
  OrderResponse({
    required this.response,
  });

  final String response;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        response: json['response'],
      );

  Map<String, dynamic> toJson() => {
        'response': response,
      };
}
