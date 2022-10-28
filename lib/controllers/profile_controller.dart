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

  void initialize() {
    nameController.text = seller.value.name!;
    accountNumberController.text = seller.value.accountNumber!.toString();
    mobileNumberController.text = seller.value.mobileNumber!.toString();
    emailController.text = seller.value.email!;
    addressController.text = seller.value.address!;
    ifscCodeController.text = seller.value.ifscCode!;
    memberCodeController.text = seller.value.memberCode!.toString();
  }

  final enable = {
    'Name': false,
    'Account Number': false,
    'Mobile Number': false,
    'IFSC Code': false,
    'Address': false,
    'Email': false,
    'Member Code': false,
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

  void updateValue(String data, String heading) {
    if (heading == 'Name') {
      updateName(data);
    } else if (heading == 'Account Number') {
      updateAccountNumber(int.parse(data));
    } else if (heading == 'Mobile Number') {
      updateMobileNumber(int.parse(data));
    } else if (heading == 'IFSC Code') {
      updateIfscCode(data);
    } else if (heading == 'Address') {
      updateAddress(data);
    } else if (heading == 'Email') {
      updateEmail(data);
    }
  }

  bool validate(String data, String heading) {
    if (heading == 'Name') {
      return validateName(data);
    } else if (heading == 'Account Number') {
      return validateAccountNumber(data);
    } else if (heading == 'Mobile Number') {
      return validateMobileNumber(data);
    } else if (heading == 'IFSC Code') {
      return validateIfscCode(data);
    } else if (heading == 'Address') {
      return validateAddress(data);
    } else if (heading == 'Email') {
      return validateEmailId(data);
    }
    return false;
  }

  bool validateName(String name) {
    name = name.trim();
    nameController.text = name;
    if (name != '' &&
        (name.isAlphabetOnly ||
            name.replaceAll('.', '').replaceAll(' ', '').isAlphabetOnly)) {
      return true;
    } else {
      nameController.text = '';
      return false;
    }
  }

  bool validateMobileNumber(String mobileNumber) {
    if (mobileNumber == '') {
      return false;
    }
    mobileNumber = mobileNumber.trim();
    mobileNumberController.text = mobileNumber;
    if ((int.tryParse(mobileNumber) != null && mobileNumber.length == 10) ||
        (int.tryParse(mobileNumber.substring(1, mobileNumber.length)) != null &&
            mobileNumber.length == 13 &&
            mobileNumber[0] == '+')) {
      return true;
    } else {
      mobileNumberController.text = '';
      return false;
    }
  }

  bool validateAccountNumber(String accountNumber) {
    if (accountNumber == '') {
      return false;
    }
    accountNumber = accountNumber.trim();
    accountNumberController.text = accountNumber;
    if (int.tryParse(accountNumber) != null) {
      return true;
    } else {
      accountNumberController.text = '';
      return false;
    }
  }

  bool validateEmailId(String emailId) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailId)) {
      return true;
    } else {
      emailController.text = '';
      return false;
    }
  }

  bool validateAddress(String address) {
    address = address.trim();
    addressController.text = address;
    if (address != '') {
      return true;
    } else {
      addressController.text = '';
      return false;
    }
  }

  bool validateIfscCode(String ifscCode) {
    ifscCode = ifscCode.trim().replaceAll(' ', '');
    ifscCodeController.text = ifscCode;
    if (ifscCode.substring(0, 4).isAlphabetOnly &&
        ifscCode.substring(5, ifscCode.length).isNumericOnly &&
        ifscCode.length == 11) {
      return true;
    } else {
      ifscCodeController.text = '';
      return false;
    }
  }
}
