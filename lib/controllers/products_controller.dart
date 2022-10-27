import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirumathikart_seller/models/product.dart';

class ProductsController extends GetxController {
  var product = Product().obs;
  var dropdownvalue = 'One'.obs;
  var isImageAdded = false.obs;
  var image = File('').obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments.category != null) {
      dropdownvalue.value = Get.arguments.category!;
    }
  }

  void updateDropdownValue(String? value) {
    dropdownvalue.value = value!;
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      isImageAdded.value = true;
      image.value = File(pickedFile.path);
    } else {
      Get.snackbar('Add/Update Product', 'No Image selected');
    }
  }

  void updateProduct(Product controllerproduct) {
    product.value = controllerproduct;
    Get.snackbar('Add/Update Product', 'Product updated Successfully');
  }
}
