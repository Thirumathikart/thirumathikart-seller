import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/constants/add_edit_product_constants.dart';
import 'package:thirumathikart_seller/models/accept_order_request.dart';
import 'package:thirumathikart_seller/models/accept_order_response.dart';
import 'package:thirumathikart_seller/models/order.dart';
import 'package:thirumathikart_seller/models/orders.dart';
import 'package:thirumathikart_seller/models/ship_order_request.dart';
import 'package:thirumathikart_seller/services/api_service.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

class OrdersController extends GetxController
    with StateMixin<AcceptOrderResponse> {
  RxList<OrderDisplay> order = <OrderDisplay>[].obs;
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
  void updateOrderOnAccept(AcceptOrderRequest acceptOrderRequest) async {
    api.updateOrderOnAccept(acceptOrderRequest, storageService).then((value) {
      Get.snackbar('Update Order', 'Order accepted Successfully');
      fetchOrder();
    }).onError((error, stackTrace) {
      Get.snackbar('Update Order', 'Order Update Failed');
    });
  }

  void updateOrderOnShip(ShipOrderRequest shipOrderRequest) async {
    api.updateOrderOnShip(shipOrderRequest, storageService).then((value) {
      Get.snackbar('Update Order', 'Order Delivered Successfully');
      fetchOrder();
    }).onError((error, stackTrace) {
      Get.snackbar('Update Order', 'Order Update Failed');
    });
  }

  void fetchOrder() async {
    await api.fetchOrder(storageService).then((response) {
      order.value = [];
      for (int i = 0; i < response.response!.length; i++) {
        var total = 0;
        final orderItems = <OrderItemDisplay>[];
        for (int j = 0; j < response.response![i].items!.length; j++) {
          orderItems.add(OrderItemDisplay(
            name: response.response![i].items![j].name,
            category: EditProductConstants
                .categoryMap[response.response![i].items![j].categoryId]
                .toString(),
            description: response.response![i].items![j].description,
            price: response.response![i].items![j].price,
            quantity: response.response![i].items![j].quantity,
            totalPrice: response.response![i].items![j].price! *
                response.response![i].items![j].quantity!,
          ));
          total += response.response![i].items![j].price! *
              response.response![i].items![j].quantity!;
        }
        order.add(OrderDisplay(
          id: response.response![i].order!.id,
          status: response.response![i].order!.orderStatus,
          totalAmount: total,
          orderItemsList: orderItems,
          customerName:
              '${response.response![i].customer!.firstName} ${response.response![i].customer!.lastName}',
          customerAddress: response.response![i].customer!.address!.line1,
          sellerAddress: response.response![i].seller!.address!.line1,
        ));
      }
    }, onError: (err) {
      Get.snackbar('Failure', 'No Orders made yet');
    });
    // final response;
    // order.value = [
    //   OrderDisplay(
    //       id: 1,
    //       status: 'Delivered',
    //       totalAmount: 1000,
    //       customerAddress: 2,
    //       sellerAddress: 3,
    //       orderItemsList: [
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200),
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200),
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200)
    //       ]),
    //   OrderDisplay(
    //       id: 2,
    //       status: 'Shipped',
    //       totalAmount: 100,
    //       customerAddress: 5,
    //       sellerAddress: 7,
    //       orderItemsList: [
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200),
    //         OrderItemDisplay(
    //             name: 'Order1',
    //             category: 'Food',
    //             description: 'jkghkjgdkgjdklgjdlgjdkgjdlkgj;dgjg',
    //             price: 10,
    //             quantity: 20,
    //             totalPrice: 200)
    //       ]),
    // ];
    //order = response;
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
    super.onReady();
  }
}
