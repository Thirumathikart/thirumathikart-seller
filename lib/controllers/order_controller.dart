import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/models/accept_order_request.dart';
import 'package:thirumathikart_seller/models/accept_order_response.dart';
import 'package:thirumathikart_seller/models/order.dart';
import 'package:thirumathikart_seller/services/api_service.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

class OrderController extends GetxController
    with StateMixin<AcceptOrderResponse> {
  final textController = TextEditingController();
  final ordersListDynamic = [].obs;
  final isSelected = [true, false].obs;
  final api = Get.find<ApiServices>().api;
  final storageService = Get.find<StorageServices>();
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
  Future<void> updateOrder(AcceptOrderRequest acceptOrderRequest) async {
    api.updateOrderOnAccept(acceptOrderRequest, storageService).then((value) {
      change(value, status: RxStatus.success());
      Get.snackbar('Update Order', 'Order Updated Successfully');
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
      Get.snackbar('Update Order', 'Order Update Failed');
    });
  }

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
    updateOrder(AcceptOrderRequest(
      orderId: 1,
    ));
    super.onReady();
  }
}
