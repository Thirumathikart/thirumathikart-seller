import 'package:thirumathikart_seller/models/product_response.dart';
import 'package:thirumathikart_seller/models/producttwo.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/services/api_service.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductResponse>> {
  //
  //Remove after Adding Backend functionality
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  List<ProductTwo> productsList = [
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 10,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 20,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 30,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 40,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 50,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 60,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 70,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 80,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 90,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
    ProductTwo(
      id: 101,
      name: 'Tomato',
      image: 'assets/tomato.jpg',
      price: 100,
      parentId: 201,
      parentName: 'Vegetables',
      details: 'Fresh Juicy Tomato',
      quantity: 10,
    ),
  ];
  //
  final textController = TextEditingController();
  final productsListDynamic = [].obs;
  final isSelected = [true, false].obs;

  Future<void> getProductsBySeller() async {
    api.getProductsForSeller(storage, 'seller').then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
      Get.snackbar('Failed To Get Products', 'Check Your Internet Connection');
    });
  }

  void increaseQtyOfSelectedItem(int index) {
    productsListDynamic[index].quantity =
        productsListDynamic[index].quantity! + 1;
  }

  void decreaseQtyOfSelectedItem(int index, ProductTwo product) {
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

  void add(List productsList, ProductTwo item) {
    productsListDynamic.add(item);
  }

  void empty() {
    productsListDynamic([]);
  }

  int length() => productsListDynamic.length;

  void set(int index, bool boolean) {
    isSelected[index] = boolean;
  }

  @override
  void onReady() {
    getProductsBySeller();
    super.onReady();
  }
}
