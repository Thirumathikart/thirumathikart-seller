import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/earning_controller.dart';

class EarningBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(EarningController());
  }
}
