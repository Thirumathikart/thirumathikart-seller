// import 'package:flutter/material.dart';
// import 'package:thirumathikart_seller/config/themes.dart';
// import 'package:thirumathikart_seller/controllers/orders_controller.dart';
// import 'package:get/get.dart';
// import 'package:thirumathikart_seller/widgets/app_bar.dart';

// class OrderPage extends GetView<OrderController> {
//   const OrderPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: appBar('Order Page'),
//         body: SingleChildScrollView(
//           physics: const NeverScrollableScrollPhysics(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Filter orders : ',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           Obx(
//                             () => ToggleButtons(
//                               borderColor: AppTheme.selected,
//                               fillColor: AppTheme.unSelected,
//                               borderWidth: 2,
//                               selectedBorderColor: AppTheme.selected,
//                               selectedColor: AppTheme.textSecondary,
//                               borderRadius: BorderRadius.circular(0),
//                               onPressed: (int index) {
//                                 for (int i = 0;
//                                     i < controller.isSelected.length;
//                                     i++) {
//                                   controller.set(i, i == index);
//                                 }
//                                 if (controller.isSelected[0] == false &&
//                                     controller.isSelected[1] == true) {
//                                   // controller.reverse();
//                                 }
//                                 if (controller.isSelected[1] == false &&
//                                     controller.isSelected[0] == true) {
//                                   // controller.reverse();
//                                 }
//                               },
//                               isSelected: controller.isSelected,
//                               children: const <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'All Orders',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'Pending',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SingleChildScrollView(
//                 child: Expanded(
//                   child: Obx(
//                     () => Container(
//                       height: MediaQuery.of(context).size.height - 150,
//                       padding: const EdgeInsets.only(bottom: 60),
//                       child: ListView.builder(
//                         itemBuilder: (ctx, index) => Column(children: [
//                           Container(
//                             margin: const EdgeInsets.only(
//                                 left: 10, right: 10, top: 8, bottom: 8),
//                             padding: const EdgeInsets.all(10.0),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: AppTheme.textPrimary),
//                               borderRadius: BorderRadius.circular(10),
//                               color: AppTheme.textSecondary,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(width: 10.0),
//                                 Expanded(
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               bottom: 10.0),
//                                           child: Text(
//                                             'Item : ${controller.ordersListDynamic[index].name!}',
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 16.0),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               bottom: 10.0),
//                                           child: Text(
//                                             'Order Quantity : ${controller.ordersListDynamic[index].quantity!}',
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               bottom: 10.0),
//                                           child: Text(
//                                             'Total : ₹ ${controller.ordersListDynamic[index].price! * controller.ordersListDynamic[index].quantity!}',
//                                           ),
//                                         ),
//                                         const Text(
//                                           'Order ready for pickup?',
//                                         ),
//                                         controller.obx(
//                                           (state) =>
//                                             Text(state!.response!),

//                                         ),

//                                         const SizedBox(height: 10.0),
//                                       ]),
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       width: 110.0,
//                                       height: 110.0,
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                         image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: AssetImage(controller
//                                               .ordersListDynamic[index].image!),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 20.0),
//                                     Text(
//                                       'Status : ${controller.ordersListDynamic[index].status!}',
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ]),
//                         itemCount: controller.length(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//       );
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/orders_controller.dart';
import 'package:thirumathikart_seller/models/accept_order_request.dart';
import 'package:thirumathikart_seller/models/ship_order_request.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class OrdersPage extends GetView<OrdersController> {
  const OrdersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.fetchOrder();
    return Scaffold(appBar: appBar('My Orders'), body: buildItems());
  }

  Widget buildItems() => Obx(() => ListView.builder(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 32, bottom: 32),
        itemBuilder: ordersList,
        itemCount: controller.order.length,
      ));
  Widget ordersList(context, index) => GestureDetector(
        onTap: () => {
          Get.toNamed(NavigationRoutes.myOrdersDetailsRoute,
              arguments: controller.order[index].orderItemsList)
        },
        child: Card(
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
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 2, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Order Name : ${controller.order[index].id}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Order Status : ${controller.order[index].status}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Total Price : ${controller.order[index].totalAmount}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Customer Address : ${controller.order[index].customerAddress}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Seller Address : ${controller.order[index].sellerAddress}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Visibility(
                              visible:
                                  controller.order[index].status == 'ORDERED',
                              child: ElevatedButton(
                                child: const Text('Accept'),
                                onPressed: () => {
                                  controller.updateOrderOnAccept(
                                      AcceptOrderRequest(
                                          orderId: controller.order[index].id))
                                },
                              ))),
                          Obx(() => Visibility(
                              visible:
                                  controller.order[index].status == 'AGREED',
                              child: ElevatedButton(
                                child: const Text('Deliver'),
                                onPressed: () => {
                                  controller.updateOrderOnShip(ShipOrderRequest(
                                      orderId: controller.order[index].id))
                                },
                              )))
                        ],
                      )
                    ]))),
      );
}
