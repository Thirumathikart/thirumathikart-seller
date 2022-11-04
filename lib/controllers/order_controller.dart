import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/models/order.dart';

class OrderController extends GetxController {
  final textController = TextEditingController();
  final ordersListDynamic = [].obs;
  final flag = true.obs;
  final isSelected = [true, false].obs;
  void setOrderType(String type, int index) {
    ordersListDynamic[index].pickup = type;
  }

  void reverse() {
    ordersListDynamic(ordersListDynamic.reversed.toList());
  }

  void add(List ordersList, Order item) {
    ordersListDynamic.add(item);
  }

  void empty() {
    ordersListDynamic([]);
  }

  void copy(List<Order> ordersList) {
    ordersListDynamic(ordersList);
  }

  int length() => ordersListDynamic.length;

  void set(int index, bool boolean) {
    isSelected[index] = boolean;
  }

  void switchFlag() {
    flag(false);
  }
}
