import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_seller/constants/api_constants.dart';
import 'package:thirumathikart_seller/models/fetch_order_response.dart';
import 'package:thirumathikart_seller/models/login_request.dart';
import 'package:thirumathikart_seller/models/login_response.dart';
import 'package:thirumathikart_seller/models/order_request.dart';
import 'package:thirumathikart_seller/models/order_response.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

class ApiServices extends GetxService {
  late ApiManager api;

  Future<ApiServices> initApi() async {
    api = ApiManager();
    return this;
  }
}

class ApiManager extends GetConnect {
  final headers = {
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
            await storageServices.storeUser(loginResponse.token);
            return loginResponse;
          }
        }
        return Future.error('Unable To Login User');
      }
    } catch (e) {
      return Future.error(e);
    }
  }


    Future<OrderResponse> createOrder(
      OrderRequest request, StorageServices storageServices) async {
    try {
      var jwt = storageServices.getUser();
      var headers = {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': jwt!
      };
      final response =
          await post(ApiConstants.orderUrl, request.toJson(), headers: headers);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var orderResponse = orderResponseFromJson(response.bodyString!);
          if (orderResponse.response == 'Order Placed Successfully') {
            return orderResponse;
          }
        }
        return Future.error('Unable To Place Order');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

//   Future<FetchAddressResponse> fetchAddress(
//       StorageServices storageServices) async {
//     try {
//       var jwt = storageServices.getUser();
//       var headers = {
//         'Accept': 'application/json',
//         'Access-Control-Allow-Origin': '*',
//         'Authorization': jwt!
//       };
//       final response = await get(ApiConstants.fetchAddress, headers: headers);
//       if (response.status.hasError) {
//         return Future.error(response.statusText!);
//       } else {
//         if (response.statusCode == 200 && response.bodyString != null) {
//           var fetchAddressResponse =
//               fetchAddressResponseFromJson(response.bodyString!);
//               storageServices.storeAddressId(fetchAddressResponse.address![0].id);
//           if (fetchAddressResponse.message == 'success') {
//             return fetchAddressResponse;
//           }
//         }
//         return Future.error('Unable To Fetch Address');
//       }
//     } catch (e) {
//       return Future.error(e);
//     }
//   }

  Future<FetchOrderResponse> fetchOrder(StorageServices storageServices) async {
    try {
      var jwt = storageServices.getUser();
      var headers = {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': jwt!
      };
      final response = await get(ApiConstants.fetchProduct, headers: headers);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var fetchOrderResponses =
              fetchOrderResponseFromJson(response.bodyString!);
          return fetchOrderResponses;
        }
        return Future.error('Unable To Fetch Product');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

//   Future<AddAddressResponse> addAddress(
//       AddAddressRequest request, StorageServices storageServices) async {
//     try {
//       var jwt = storageServices.getUser();
//       var headers = {
//         'Accept': 'application/json',
//         'Access-Control-Allow-Origin': '*',
//         'Authorization': jwt!
//       };
//       final response = await post(ApiConstants.addAddress, request.toJson(),
//           headers: headers);
//       if (response.status.hasError) {
//         return Future.error(response.statusText!);
//       } else {
//         if (response.statusCode == 200 && response.bodyString != null) {
//           var addAddressResponse =
//               addAddressResponseFromJson(response.bodyString!);
//           if (addAddressResponse.message == 'success') {
//             return addAddressResponse;
//           }
//         }
//         return Future.error('Unable To Add Address');
//       }
//     } catch (e) {
//       return Future.error(e);
//     }
//   }

//   Future<UpdateAddressResponse> updateAddress(
//       UpdateAddressRequest request, StorageServices storageServices) async {
//     try {
//       var jwt = storageServices.getUser();
//       var headers = {
//         'Accept': 'application/json',
//         'Access-Control-Allow-Origin': '*',
//         'Authorization': jwt!
//       };
//       final response = await post(ApiConstants.updateAddress, request.toJson(),
//           headers: headers);
//       if (response.status.hasError) {
//         return Future.error(response.statusText!);
//       } else {
//         if (response.statusCode == 200 && response.bodyString != null) {
//           var updateAddressResponse =
//               updateAddressResponseFromJson(response.bodyString!);
//           if (updateAddressResponse.message == 'success') {
//             return updateAddressResponse;
//           }
//         }
//         return Future.error('Unable To Update Address');
//       }
//     } catch (e) {
//       return Future.error(e);
//     }
//   }
// }

}
