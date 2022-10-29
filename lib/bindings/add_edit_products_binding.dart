import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/add_edit_products_controller.dart';

class AddEditProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddEditProductsController());
  }
}
