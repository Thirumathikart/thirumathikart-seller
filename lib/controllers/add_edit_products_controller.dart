import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirumathikart_seller/constants/add_edit_product_constants.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/models/create_product_request.dart';
import 'package:thirumathikart_seller/models/product.dart';
import 'package:thirumathikart_seller/services/api_service.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

class AddEditProductsController extends GetxController {
  var product = Product().obs;
  var dropdownvalue = EditProductConstants.categoryItems[0].obs;
  var isImageAdded = false.obs;
  var isLoading = false.obs;
  var image = File('').obs;
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  var isChange = {
    EditProductConstants.name: false,
    EditProductConstants.price: false,
    EditProductConstants.category: false,
    EditProductConstants.description: false,
    EditProductConstants.quantity: false
  }.obs;

  void updateChange(String constant) {
    isChange[constant] = !isChange[constant]!;
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

  void updateProduct(Product controllerproduct) async {
    product.value = controllerproduct;
    if (controllerproduct.category != null &&
        controllerproduct.description != null &&
        controllerproduct.name != null &&
        controllerproduct.price != null &&
        controllerproduct.image != null &&
        controllerproduct.quantity != null) {
      CreateProductRequest request = CreateProductRequest(
          categoryId: EditProductConstants.categoryMap[controllerproduct.category]!,
          price: int.parse(controllerproduct.price!),
          stock: int.parse(controllerproduct.quantity!),
          title: controllerproduct.name!,
          description: controllerproduct.description!);
      isLoading.value = true;
      api.createProduct(request, controllerproduct.image!,storage).then((value) {
        isLoading.value = false;
        Get.snackbar('Add/Update Product', 'Product created successfully');
        Get.offAndToNamed(NavigationRoutes.home);
      }, onError: (err) {
        isLoading.value = false;
        Get.snackbar('Add/Update Product', 'Unable to create product');
      });
    } else {
      print("hello");
    }
  }
}
