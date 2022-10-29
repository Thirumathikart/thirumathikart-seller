import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/products_controller.dart';

class AddEditProductField extends GetView<ProductsController> {
  const AddEditProductField(
      {Key? key, required this.productName, required this.namecontroller})
      : super(key: key);
  final String productName;
  final TextEditingController namecontroller;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Visibility(
                      visible:
                          Get.routing.current == NavigationRoutes.editProduct,
                      child: Obx(() => IconButton(
                            onPressed: () {
                              controller.updateChange(productName);
                            },
                            icon: controller.isChange[productName]!
                                ? const Icon(Icons.check)
                                : const Icon(Icons.edit),
                            color: controller.isChange[productName]!
                                ? AppTheme.facebook
                                : AppTheme.chakra,
                            iconSize: 20,
                          )),
                    )
                  ],
                ),
                Obx(
                  () => controller.isChange[productName]! ||
                          Get.routing.current == NavigationRoutes.addProduct
                      ? TextFormField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter ${productName.toLowerCase()}';
                            }
                            return null;
                          },
                        )
                      : Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 1),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(namecontroller.text,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                )),
                          )),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
          ),
        ],
      );
}
