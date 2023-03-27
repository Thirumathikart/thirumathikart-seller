import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/controllers/seller_controller.dart';
import 'package:thirumathikart_seller/views/profile.dart';

class SellerPage extends GetView<SellerController> {
  const SellerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: ProfilePage(),
      );
}
