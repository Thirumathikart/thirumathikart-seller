import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController());
  }
}
