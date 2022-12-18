import 'package:get_storage/get_storage.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_seller/constants/storage_constants.dart';
import 'package:thirumathikart_seller/models/login_response.dart';

class StorageServices extends GetxService {
  late GetStorage storage;

  Future<StorageServices> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    return this;
  }

  Future<void> storeUser(String user) async {
    await storage.write(StorageConstants.user, user);
  }

  User? getUser() =>
      loginResponseFromJson(storage.read(StorageConstants.user)).user;
}
