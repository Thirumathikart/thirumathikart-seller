import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/add_edit_products_controller.dart';

class AddEditProductField extends GetView<AddEditProductsController> {
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
                      ? Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                              fillColor: AppTheme.bg,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide:
                                    BorderSide(color: AppTheme.textPrimary),
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter ${productName.toLowerCase()}';
                              }
                              return null;
                            },
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 1),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.textPrimary),
                              borderRadius: BorderRadius.circular(15),
                              color: AppTheme.searchBar),
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
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
            child: Divider(
              color: AppTheme.searchBar,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
          ),
        ],
      );
}
