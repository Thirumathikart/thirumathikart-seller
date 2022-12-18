import 'package:get_storage/get_storage.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_seller/constants/storage_constants.dart';

class StorageServices extends GetxService {
  late GetStorage storage;

  Future<StorageServices> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    return this;
  }

  Future<void> storeProdcuts(Map<String, String> res, String category) async {
    Map<String, dynamic> products = retriveProducts() ?? {};
    if (products != {}) {
      if (products[category] != null) {
        products[category] = res[category]!;
      } else {
        products.addAll(res);
      }
    } else {
      products = res;
    }
    storage.write(StorageConstants.products, products);
  }

  Map<String, dynamic>? retriveProducts() =>
      storage.read(StorageConstants.products);

  void storeJWT(String jwt) async =>
      await storage.write(StorageConstants.jwt, jwt);

  String? retriveJWT() => storage.read(StorageConstants.jwt);
}
