import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        username: json['username'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
