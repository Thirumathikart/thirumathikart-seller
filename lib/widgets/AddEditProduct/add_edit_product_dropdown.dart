import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/add_edit_product_constants.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/add_edit_products_controller.dart';

class AddEditProductDropDown extends GetView<AddEditProductsController> {
  const AddEditProductDropDown({
    Key? key,
    required this.productName,
    this.isCategory = true,
  }) : super(key: key);
  final String productName;
  final bool isCategory;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                    Obx(
                      () => Visibility(
                        visible:
                            Get.routing.current == NavigationRoutes.editProduct,
                        child: IconButton(
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
                        ),
                      ),
                    )
                  ],
                ),
                Obx(
                  () =>
                      // TODO: What's this?
                      // controller.isChange[productName]! ||
                      Get.routing.current == NavigationRoutes.addProduct
                          ? Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              height: 50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: DropdownButtonFormField(
                                  isDense: true,
                                  decoration: InputDecoration(
                                    fillColor: AppTheme.bg,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: AppTheme.textPrimary,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: AppTheme.textPrimary),
                                    ),
                                  ),
                                  isExpanded: false,
                                  items: isCategory
                                      ? EditProductConstants.categoryItems
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList()
                                      : EditProductConstants.productWeightItems
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList(),
                                  value: isCategory
                                      ? controller.dropdownvalue.value
                                      : controller.dropdownvalue1.value,
                                  onChanged: (value) {
                                    // TODO: include both dropdowns
                                    if (isCategory) {
                                      controller.updateDropdownValue(value);
                                    } else {
                                      controller.updateDropdownValue1(value);
                                    }
                                  },
                                  // items1:
                                  //     EditProductConstants.productWeightItems
                                  //         .map((e) => DropdownMenuItem(
                                  //               value: e,
                                  //               child: Text(e),
                                  //             ))
                                  //         .toList(),
                                  // value1: controller.dropdownvalue1.value,
                                  // onChanged1: (value1) {
                                  //   controller.updateDropdownValue1(value1);
                                  // },
                                ),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 1),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppTheme.textPrimary),
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppTheme.searchBar),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(controller.dropdownvalue.value,
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
