import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';
import 'package:thirumathikart_seller/models/product.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar('Home'),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(NavigationRoutes.editProduct,
                    arguments: Product(
                        name: 'product_name',
                        price: '100',
                        imageUrl:
                            'https://aaveg.in/22/assets/images/team/110120090.jpg',
                        quantity: '100',
                        description: 'okay',
                        category: 'Two'));
              },
              child: const Text('Edit Product'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(NavigationRoutes.addProduct, arguments: Product());
              },
              child: const Text('Add Product'),
            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 100,
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.red),
                  child: GestureDetector(
                    onTap: () {
                      Get.offAndToNamed('/order');
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: 100,
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: GestureDetector(
                    onTap: () {
                      Get.offAndToNamed('/product');
                    },
                  ),
                ),
              ),
            ],
          ),
          ],
        ))); //TODO : Need to remove After PR review
        
}
