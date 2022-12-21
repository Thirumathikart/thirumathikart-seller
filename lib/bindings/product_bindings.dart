import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/order_controller.dart';
import 'package:thirumathikart_seller/controllers/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(OrderController());

  }
}
