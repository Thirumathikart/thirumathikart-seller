import 'package:thirumathikart_seller/models/product.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  final textController = TextEditingController();
  final productsListDynamic = [].obs;
  final flag = true.obs;
  final isSelected = [true, false].obs;

  void increaseQtyOfSelectedItem(int index) {
    productsListDynamic[index].quantity =
        productsListDynamic[index].quantity! + 1;
  }

  void decreaseQtyOfSelectedItem(int index, Product product) {
    if (product.quantity == 1) {
      productsListDynamic.removeAt(index);
    } else {
      productsListDynamic[index].quantity =
          productsListDynamic[index].quantity! - 1;
    }
  }

  void deleteItem(int index) {
    productsListDynamic.removeAt(index);
  }

  void add(List productsList, Product item) {
    productsListDynamic.add(item);
  }

  void empty() {
    productsListDynamic([]);
  }

  void copy(List<Product> productsList) {
    productsListDynamic(productsList);
  }

  int length() => productsListDynamic.length;

  void set(int index, bool boolean) {
    isSelected[index] = boolean;
  }

  void switchFlag() {
    flag(false);
  }
}
