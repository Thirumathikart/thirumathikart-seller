import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/order_controller.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/models/orders.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class OrdersPage extends GetView<OrderController> {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchOrder();
    return Scaffold(
      appBar: appBar('My Orders'),
      body: buildItems(),
    );
  }

  Widget buildItems() => Obx(
        () => ListView.builder(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 32, bottom: 32),
          itemBuilder: (context, orderIndex) {
            final order = controller.order[orderIndex];
            return Column(
              children: [
                Card(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 2, bottom: 2, right: 5),
                          alignment: Alignment.center,
                          child: Text(
                            // 'Order ID : ${order.id}',
                            'Todays Orders',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        // Display order details
                        for (var orderItem in order.orderItemsList!)
                          Column(
                            children: [
                              Card(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Product Name: ${orderItem.name}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.textPrimary,
                                        ),
                                      ),
                                      Text(
                                        'Quantity: ${orderItem.quantity}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.textPrimary,
                                        ),
                                      ),
                                      Text(
                                        'Price: ${orderItem.price}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.textPrimary,
                                        ),
                                      ),
                                      Text(
                                        'Total Price: ${orderItem.totalPrice}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.textPrimary,
                                        ),
                                      ),
                                      // Add more product details as needed
                                    ],
                                  ),
                                ),
                              ),
                              // Order status button for each order item
                             ElevatedButton(
  onPressed: () {
    // Display a snackbar with a confirmation message
    Get.snackbar(
      'Order Status',
      'Are you sure you want to mark the entire order as delivered?',
      duration: Duration(seconds: 5),
      mainButton: TextButton(
        onPressed: () {
          // You can add the logic to change the order status here
          // For example:
          // controller.changeOrderStatus(orderIndex);
          Get.back(); // Close the snackbar
        },
        child: Text(
          'OK',
          style: TextStyle(color: Color.fromARGB(255, 227, 12, 12)),
        ),
      ),
    );
  },
  child: Text('Mark Order as Shipped'),
),

                              SizedBox(height: 16),
                            ],
                          ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 2, bottom: 5, right: 5),
                          alignment: Alignment.center,
                          child: Text(
                            'Order Status : ${order.status}',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        // Add the order status button here for the entire order
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // You can add the logic to change the order status here
                        //     // For example:
                             
                          
                        //   },
                        //   child: Text('Mark Entire Order as Delivered'),
                        // ),

                        
                      ],
                    ),
                  ),
                ),
                // Add any spacing you want between the cards
                SizedBox(height: 16),
              ],
            );
          },
          itemCount: controller.order.length,
        ),
      );
}
