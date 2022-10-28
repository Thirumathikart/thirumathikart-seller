import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/controllers/profile_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/widgets/card/profile_card.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNodeName = FocusNode();
    final FocusNode focusNodeAccountNumber = FocusNode();
    final FocusNode focusNodeMobileNumber = FocusNode();
    final FocusNode focusNodeEmail = FocusNode();
    final FocusNode focusNodeAddress = FocusNode();
    final FocusNode focusNodeIfscCode = FocusNode();

    controller.initialize();

    return Scaffold(
      appBar: appBar('Seller Profile'),
      //drawer: const NavWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(controller, focusNodeName, 'Name', TextInputType.name,
                controller.nameController),
            ProfileCard(controller, focusNodeAccountNumber, 'Account Number',
                TextInputType.number, controller.accountNumberController),
            ProfileCard(controller, focusNodeMobileNumber, 'Mobile Number',
                TextInputType.phone, controller.mobileNumberController),
            ProfileCard(controller, focusNodeEmail, 'Email',
                TextInputType.emailAddress, controller.emailController),
            ProfileCard(controller, focusNodeAddress, 'Address',
                TextInputType.multiline, controller.addressController),
            ProfileCard(controller, focusNodeIfscCode, 'IFSC Code',
                TextInputType.name, controller.ifscCodeController),
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
                    controller: controller.memberCodeController,
                    enabled: controller.enable['Member Code']!,
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
}
