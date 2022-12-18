import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_seller/constants/api_constants.dart';
import 'package:thirumathikart_seller/models/login_request.dart';
import 'package:thirumathikart_seller/models/login_response.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

import 'package:thirumathikart_seller/models/create_product_request.dart';

class ApiServices extends GetxService {
  late ApiManager api;

  Future<ApiServices> initApi() async {
    api = ApiManager();
    return this;
  }
}

class ApiManager extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 10);
  }

  var headers = {
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };

  Future<LoginResponse> loginSeller(
      LoginRequest request, StorageServices storageServices) async {
    try {
      final response =
          await post(ApiConstants.login, request.toJson(), headers: headers);

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var loginResponse = loginResponseFromJson(response.bodyString!);
          if (loginResponse.message == 'User Authenticated Successfully') {
            storageServices.storeJWT(loginResponse.token);
            return loginResponse;
          }
        }
        return Future.error('Unable To Login User');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> createProduct(
    CreateProductRequest request,
    File file,
    StorageServices storageServices
  ) async {
    try {
      final GetConnect _connect = GetConnect(
        // the request will fail if it takes more than 10 seconds
        // you can use another value if you like
        timeout: const Duration(seconds: 100),
      );
      var jwt=storageServices.retriveJWT();
      var headers = {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': jwt!
    };
      FormData formData = FormData(request.toJson());
      formData.files.add(
          MapEntry('files', MultipartFile(file, filename: 'products.jpg')));
      final response =
          await _connect.post(ApiConstants.createProduct, formData);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200) {
          return 'success';
        }
        return Future.error(response.statusText.toString());
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
