import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/controllers/profile_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';

class ProfilePage extends GetView<HomeController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profilePageController = Get.find<ProfileController>();
    final FocusNode focusNodeName = FocusNode();
    final FocusNode focusNodeAccountNumber = FocusNode();
    final FocusNode focusNodeMobileNumber = FocusNode();
    final FocusNode focusNodeEmail = FocusNode();
    final FocusNode focusNodeAddress = FocusNode();
    final FocusNode focusNodeIfscCode = FocusNode();

    profilePageController.nameController.text =
        profilePageController.seller.value.name!;
    profilePageController.accountNumberController.text =
        profilePageController.seller.value.accountNumber!.toString();
    profilePageController.mobileNumberController.text =
        profilePageController.seller.value.mobileNumber!.toString();
    profilePageController.emailController.text =
        profilePageController.seller.value.email!;
    profilePageController.addressController.text =
        profilePageController.seller.value.address!;
    profilePageController.ifscCodeController.text =
        profilePageController.seller.value.ifscCode!;
    profilePageController.memberCodeController.text =
        profilePageController.seller.value.memberCode!.toString();

    return Scaffold(
      appBar: appBar('Seller Profile'),
      //drawer: const NavWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['name']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('name');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodeName.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('name');
                            profilePageController.updateName(
                                profilePageController.nameController.text);
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateName(
                            profilePageController.nameController.text,
                            profilePageController.nameController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: profilePageController.nameController,
                      focusNode: focusNodeName,
                      enabled: profilePageController.enable['name']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid Name',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('name');
                        profilePageController.updateName(
                            profilePageController.nameController.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Account Number',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['accountNumber']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('accountNumber');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodeAccountNumber.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('accountNumber');
                            profilePageController.updateAccountNumber(int.parse(
                                profilePageController
                                    .accountNumberController.text));
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateAccountNumber(
                            profilePageController.accountNumberController.text,
                            profilePageController.accountNumberController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: profilePageController.accountNumberController,
                      focusNode: focusNodeAccountNumber,
                      enabled: profilePageController.enable['accountNumber']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid Account Number',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('accountNumber');
                        profilePageController.updateAccountNumber(int.parse(
                            profilePageController
                                .accountNumberController.text));
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['mobileNumber']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('mobileNumber');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodeMobileNumber.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('mobileNumber');
                            profilePageController.updateMobileNumber(int.parse(
                                profilePageController
                                    .mobileNumberController.text));
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateMobileNumber(
                            profilePageController.mobileNumberController.text,
                            profilePageController.mobileNumberController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: profilePageController.mobileNumberController,
                      focusNode: focusNodeMobileNumber,
                      enabled: profilePageController.enable['mobileNumber']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid Mobile Number',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('mobileNumber');
                        profilePageController.updateMobileNumber(int.parse(
                            profilePageController.mobileNumberController.text));
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Email ID',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['email']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('email');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodeEmail.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('email');
                            profilePageController.updateEmail(
                                profilePageController.emailController.text);
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateEmailId(
                            profilePageController.emailController.text,
                            profilePageController.emailController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: profilePageController.emailController,
                      focusNode: focusNodeEmail,
                      enabled: profilePageController.enable['email']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid Email ID',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('email');
                        profilePageController.updateEmail(
                            profilePageController.emailController.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['address']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('address');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodeAddress.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('address');
                            profilePageController.updateAddress(
                                profilePageController.addressController.text);
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateAddress(
                            profilePageController.addressController.text,
                            profilePageController.addressController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: profilePageController.addressController,
                      focusNode: focusNodeAddress,
                      enabled: profilePageController.enable['address']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid Address',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('address');
                        profilePageController.updateAddress(
                            profilePageController.addressController.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'IFSC Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Obx(
                  () => !profilePageController.enable['ifscCode']!
                      ? IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('ifscCode');
                            Future.delayed(const Duration(milliseconds: 100),
                                focusNodeIfscCode.requestFocus);
                          },
                          icon: const Icon(Icons.edit),
                          color: AppTheme.chakra,
                          iconSize: 20,
                        )
                      : IconButton(
                          onPressed: () {
                            profilePageController.switchFlag('ifscCode');
                            profilePageController.updateIfscCode(
                                profilePageController.ifscCodeController.text);
                          },
                          icon: const Icon(Icons.check_rounded),
                          color: AppTheme.facebook,
                          iconSize: 30,
                        ),
                ),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.searchBar,
                    border: validateIfscCode(
                            profilePageController.ifscCodeController.text,
                            profilePageController.ifscCodeController)
                        ? Border.all(
                            color: AppTheme.searchBar,
                            width: 2,
                          )
                        : Border.all(
                            color: AppTheme.bin,
                            width: 2,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: profilePageController.ifscCodeController,
                      focusNode: focusNodeIfscCode,
                      enabled: profilePageController.enable['ifscCode']!,
                      decoration: const InputDecoration(
                        hintText: 'Enter valid IFSC Code',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onSubmitted: (string) {
                        profilePageController.switchFlag('ifscCode');
                        profilePageController.updateIfscCode(
                            profilePageController.ifscCodeController.text);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppTheme.divider,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Member Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppTheme.searchBar,
                  border: Border.all(
                    color: AppTheme.searchBar,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    controller: profilePageController.memberCodeController,
                    enabled: profilePageController.enable['memberCode']!,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
            ),
          ],
        ),
      ),
    );
  }

  bool validateName(String name, TextEditingController controller) {
    name = name.trim();
    controller.text = name;
    if (name != '' &&
        (name.isAlphabetOnly ||
            name.replaceAll('.', '').replaceAll(' ', '').isAlphabetOnly)) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateMobileNumber(
      String mobileNumber, TextEditingController controller) {
    if (mobileNumber == '') {
      return false;
    }
    mobileNumber = mobileNumber.trim();
    controller.text = mobileNumber;
    if ((int.tryParse(mobileNumber) != null && mobileNumber.length == 10) ||
        (int.tryParse(mobileNumber.substring(1, mobileNumber.length)) != null &&
            mobileNumber.length == 13 &&
            mobileNumber[0] == '+')) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateAccountNumber(
      String accountNumber, TextEditingController controller) {
    if (accountNumber == '') {
      return false;
    }
    accountNumber = accountNumber.trim();
    controller.text = accountNumber;
    if (int.tryParse(accountNumber) != null) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateEmailId(String emailId, TextEditingController controller) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailId)) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateAddress(String address, TextEditingController controller) {
    address = address.trim();
    controller.text = address;
    if (address != '') {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }

  bool validateIfscCode(String ifscCode, TextEditingController controller) {
    ifscCode = ifscCode.trim().replaceAll(' ', '');
    controller.text = ifscCode;
    if (ifscCode.substring(0, 4).isAlphabetOnly &&
        ifscCode.substring(5, ifscCode.length).isNumericOnly &&
        ifscCode.length == 11) {
      return true;
    } else {
      controller.text = '';
      return false;
    }
  }
}
