import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/models/order.dart';

class OrderController extends GetxController {
  final textController = TextEditingController();
  final ordersListDynamic = [].obs;
  final isSelected = [true, false].obs;
  //
  //Remove after Adding Backend functionality
  List<Order> ordersList = [
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 10,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 20,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 30,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 40,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 50,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 60,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 70,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 80,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 90,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
    Order(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 100,
      status: 'Prepared',
      quantity: 20,
      pickup: '',
    ),
  ];
  //
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

  int length() => ordersListDynamic.length;

  void set(int index, bool boolean) {
    isSelected[index] = boolean;
  }

  @override
  void onReady() {
    ordersListDynamic(ordersList);
    super.onReady();
  }
}
