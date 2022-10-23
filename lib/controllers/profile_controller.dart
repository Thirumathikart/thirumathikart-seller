import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/models/seller.dart';

class ProfileController extends GetxController {
  final seller = Seller(
    sellerId: 1,
    name: 'Ram narain',
    accountNumber: 12345,
    mobileNumber: 9988776655,
    address: 'No. 12, 2nd Street\nTiruchi, Tamil Nadu\n620015',
    ifscCode: 'HDFC0000000',
    email: 'ramnarain@gmail.com',
    memberCode: 100,
  ).obs;
  final nameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final ifscCodeController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final memberCodeController = TextEditingController();

  final enable = {
    'name': false,
    'accountNumber': false,
    'mobileNumber': false,
    'ifscCode': false,
    'address': false,
    'email': false,
    'memberCode': false,
  }.obs;

  void updateName(String name) {
    seller.value.name = name;
  }

  void updateAccountNumber(int accountNumber) {
    seller.value.accountNumber = accountNumber;
  }

  void updateMobileNumber(int mobileNumber) {
    seller.value.mobileNumber = mobileNumber;
  }

  void updateEmail(String email) {
    seller.value.email = email;
  }

  void updateAddress(String address) {
    seller.value.address = address;
  }

  void updateIfscCode(String ifscCode) {
    seller.value.ifscCode = ifscCode;
  }

  void switchFlag(String key) {
    enable[key] = enable[key]! ? false : true;
  }
}
