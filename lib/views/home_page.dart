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
          ElevatedButton(
            onPressed: () {
              Get.toNamed(NavigationRoutes.product);
            },
            child: const Text('Product List'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(NavigationRoutes.order);
            },
            child: const Text('Order List'),
          ),
        ],
      ))); //TODO : Need to remove After PR review

}
