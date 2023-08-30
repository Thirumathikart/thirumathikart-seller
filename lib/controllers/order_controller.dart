


import 'package:get/get.dart';
import 'package:thirumathikart_seller/constants/product_constants.dart';
import 'package:thirumathikart_seller/models/orders.dart';
import 'package:thirumathikart_seller/services/api_service.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';
import 'package:thirumathikart_seller/models/fetch_order_request.dart';
import 'package:thirumathikart_seller/models/fetch_order_response.dart';

class OrderController extends GetxController {
  RxList<OrderDisplay> order = <OrderDisplay>[].obs;
  final api = Get.find<ApiServices>().api;
  final storageService = Get.find<StorageServices>();

 final orderItems = <OrderItemDisplay>[];





  void fetchOrder() async {
  await api.fetchOrder(storageService).then(
    (response) {
      Get.snackbar('Order Fetched', 'Order Fetched Successfully.');

      Map<int, OrderDisplay> sellerOrderMap = {};

      for (int i = 0; i < response.response!.length; i++) {
  var total = 0;
  final orderItems = <OrderItemDisplay>[];

  for (int j = response.response![i].items!.length - 1; j >= 0 && j >= response.response![i].items!.length - 50; j--) {
    orderItems.add(OrderItemDisplay(
      name: response.response![i].items![j].name,
      category: ProductConstants
          .categoryMap[response.response![i].items![j].categoryId]
          .toString(),
      description: response.response![i].items![j].description,
      price: response.response![i].items![j].price,
      quantity: response.response![i].items![j].quantity,
      totalPrice: response.response![i].items![j].price! *
          response.response![i].items![j].quantity!,
          // j : j - response.response![i].items![j].quantity,
    ));
    total += response.response![i].items![j].price! *
        response.response![i].items![j].quantity!;
  }

  // Print the orderItems list after the inner loop has finished
  print('Order Items for Order $i:');
  for (var item in orderItems) {
    print(item);
  }
      

        // Get the seller ID from the order response
        int sellerId = response.response![i].seller!.userId!;

        // If the seller is already present in the map, add the order items to the existing order display
        if (sellerOrderMap.containsKey(sellerId)) {
          sellerOrderMap[sellerId]!.orderItemsList!.addAll(orderItems);
          // sellerOrderMap[sellerId]!.totalAmount = total;
        } else {
          // If the seller is not present in the map, create a new OrderDisplay
          sellerOrderMap[sellerId] = OrderDisplay(
            id: response.response![i].order!.id,
            status: response.response![i].order!.orderStatus.toString(),
            totalAmount: total,
            orderItemsList: orderItems,
             customerAddress:'${response.response![i].customer!.address!.line1}  ${response.response![i].customer!.address!.line2}   ${ response.response![i].customer!.address!.landmark}   ${response.response![i].customer!.address!.district}   ${response.response![i].customer!.address!.state}  ${response.response![i].customer!.address!.pincode}',
            customerContact:response.response![i].customer!.contact,
          
           

            sellerName:
                '${response.response![i].seller!.firstName} ${response.response![i].seller!.lastName}',
            sellerAddress: response.response![i].seller!.address!.line1,
          );
        }
      }

      // Convert the values of the map to a list and update the 'order' RxList
      order.value = sellerOrderMap.values.toList();
    },
    onError: (err) {
      Get.snackbar('Failure', 'No orders made yet');
    },
  );
}
}
