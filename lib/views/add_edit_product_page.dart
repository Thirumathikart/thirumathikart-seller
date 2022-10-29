import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/controllers/products_controller.dart';
import 'package:thirumathikart_seller/models/product.dart';
import 'package:thirumathikart_seller/widgets/add_edit_product_dropdown.dart';
import 'package:thirumathikart_seller/widgets/add_edit_product_field.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class AddEditProductPage extends GetView<ProductsController> {
  AddEditProductPage({super.key});
  final _nameController =
      TextEditingController(text: '${Get.arguments.name ?? ''}');
  final _priceController =
      TextEditingController(text: '${Get.arguments.price ?? ' '}');
  final _descController =
      TextEditingController(text: '${Get.arguments.description ?? ' '}');
  final _quantityController =
      TextEditingController(text: '${Get.arguments.quantity ?? ' '}');
  final List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar('Add/Edit Product'),
        body: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            children: [
              Obx(() => GestureDetector(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Container(
                        decoration: controller.isImageAdded.value
                            ? const BoxDecoration()
                            : BoxDecoration(
                                border: Border.all(color: Colors.black)),
                        child: controller.isImageAdded.value
                            ? Image.file(controller.image.value)
                            : Get.arguments.imageUrl != null
                                ? Image.network(Get.arguments.imageUrl)
                                : const Center(
                                    child: Text(
                                        '\t \t \t No Image Added \n Click here to add image'),
                                  ),
                      ),
                    ),
                    onTap: () {
                      controller.pickImage();
                    },
                  )),
              AddEditProductField(
                productName: 'Name',
                namecontroller: _nameController,
              ),
              AddEditProductField(
                productName: 'Price',
                namecontroller: _priceController,
              ),
              AddEditProductDropDown(productName: 'Category'),
              AddEditProductField(
                productName: 'Description',
                namecontroller: _descController,
              ),
              AddEditProductField(
                productName: 'Quantity',
                namecontroller: _quantityController,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      var product = Product(
                        name: _nameController.text,
                        price: _priceController.text,
                        category: controller.dropdownvalue.value,
                        description: _descController.text,
                        image: controller.image.value,
                        quantity: _quantityController.text,
                      );
                      controller.updateProduct(product);
                    } else {
                      Get.snackbar(
                          'Add/Update Product', 'Please fill all the fields');
                    }
                  },
                  child: const Text('Add Product'))
            ],
          ),
        )),
      );
}
