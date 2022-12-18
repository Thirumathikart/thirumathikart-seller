import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/main_controller.dart';
import 'package:thirumathikart_seller/controllers/profile_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(ProfileController());
  }
}
