import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/controllers/products_controller.dart';
import 'package:thirumathikart_seller/models/product.dart';
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Category',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 72,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter Category',
                              border: OutlineInputBorder(),
                            ),
                            isExpanded: true,
                            items: list
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            value: controller.dropdownvalue.value,
                            onChanged: (value) {
                              controller.updateDropdownValue(value);
                            },
                          ),
                        ),
                      ),
                    ]),
              ),
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
