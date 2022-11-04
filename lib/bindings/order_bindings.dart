import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/order_controller.dart';

class OrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController());
  }
}
