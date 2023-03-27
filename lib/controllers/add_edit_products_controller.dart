import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirumathikart_seller/constants/add_edit_product_constants.dart';
import 'package:thirumathikart_seller/models/product.dart';

class AddEditProductsController extends GetxController {
  var product = Product().obs;
  var dropdownvalue = EditProductConstants.categoryItems[0].obs;
  var dropdownvalue1 = EditProductConstants.productWeightItems[0].obs;
  var isImageAdded = false.obs;
  var image = File('').obs;
  var isChange = {
    EditProductConstants.name: false,
    EditProductConstants.price: false,
    EditProductConstants.category: false,
    EditProductConstants.description: false,
    EditProductConstants.productWeight: false,
    EditProductConstants.quantity: false
  }.obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments.category != null) {
      dropdownvalue.value = Get.arguments.category!;
    }
    if (Get.arguments.productWeight != null) {
      dropdownvalue1.value = Get.arguments.productWeight!;
    }
  }

  void updateChange(String constant) {
    isChange[constant] = !isChange[constant]!;
  }

  void updateDropdownValue(String? value) {
    dropdownvalue.value = value!;
  }

  void updateDropdownValue1(String? value) {
    dropdownvalue1.value = value!;
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
