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

  Future<void> storeUser(String user) async {
    await storage.write(StorageConstants.user, user);
  }

  String? getUser() {
    if (storage.read(StorageConstants.user) == null) {
      return null;
    }
    return storage.read(StorageConstants.user);
  }
}
