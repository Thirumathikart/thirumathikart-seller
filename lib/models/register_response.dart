import 'dart:convert';

RegistrationResponse registrationResponseFromJson(String str) =>
    RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) =>
    json.encode(data.toJson());

class RegistrationResponse {
  RegistrationResponse({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      RegistrationResponse(
        code: json['code'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
      };
}
