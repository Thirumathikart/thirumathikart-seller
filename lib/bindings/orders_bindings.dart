import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/orders_controller.dart';

class OrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}
