import 'dart:convert';

RegistrationRequest registrationRequestFromJson(String str) =>
    RegistrationRequest.fromJson(json.decode(str));

String registrationRequestToJson(RegistrationRequest data) =>
    json.encode(data.toJson());

class RegistrationRequest {
  RegistrationRequest({
    required this.customerFirstName,
    required this.customerLastName,
    required this.customerEmail,
    required this.customerContact,
    required this.hashedPassword,
  });

  final String customerFirstName;
  final String customerLastName;
  final String customerEmail;
  final String customerContact;
  final String hashedPassword;

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      RegistrationRequest(
        customerFirstName: json['customer_first_name'],
        customerLastName: json['customer_last_name'],
        customerEmail: json['customer_email'],
        customerContact: json['customer_contact'],
        hashedPassword: json['hashed_password'],
      );

  Map<String, dynamic> toJson() => {
        'customer_first_name': customerFirstName,
        'customer_last_name': customerLastName,
        'customer_email': customerEmail,
        'customer_contact': customerContact,
        'hashed_password': hashedPassword,
      };
}
