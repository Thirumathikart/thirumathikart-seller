import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:thirumathikart_seller/models/order.dart';
import 'package:thirumathikart_seller/models/product.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar('Home'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 100,
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.red),
                  child: GestureDetector(
                    onTap: () {
                      List<Order> orderList = [];

                      for (int i = 0; i < 10; i++) {
                        orderList.add(Order(
                          id: 101,
                          name: 'Tomato',
                          image: 'assets/tomato.jpg',
                          price: i * 10 + 10,
                          status: 'Prepared',
                          quantity: 20,
                          pickup: '',
                        ));
                      }
                      Get.offAndToNamed('/order', arguments: orderList);
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
                      List<Product> productList = [];

                      for (int i = 0; i < 10; i++) {
                        productList.add(Product(
                          id: 101,
                          name: 'Tomato',
                          image: 'assets/tomato.jpg',
                          price: i * 10 + 10,
                          parentId: 201,
                          parentName: 'Vegetables',
                          details: 'Fresh Juicy Tomato',
                          quantity: 10,
                        ));
                      }
                      Get.offAndToNamed('/product', arguments: productList);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
