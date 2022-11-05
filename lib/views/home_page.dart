import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
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
        ),
      );
}
