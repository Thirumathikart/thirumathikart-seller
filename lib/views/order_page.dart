import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/controllers/order_controller.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersController = Get.find<OrderController>();
    final ordersListMain = Get.arguments;
    if (ordersController.flag.value) {
      ordersController.copy(ordersListMain);
      ordersController.switchFlag();
    }
    return Scaffold(
      appBar: appBar('Order Page'),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Filter orders : ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Obx(
                          () => ToggleButtons(
                            borderColor: AppTheme.selected,
                            fillColor: AppTheme.unSelected,
                            borderWidth: 2,
                            selectedBorderColor: AppTheme.selected,
                            selectedColor: AppTheme.textSecondary,
                            borderRadius: BorderRadius.circular(0),
                            onPressed: (int index) {
                              for (int i = 0;
                                  i < ordersController.isSelected.length;
                                  i++) {
                                ordersController.set(i, i == index);
                              }
                              if (ordersController.isSelected[0] == false &&
                                  ordersController.isSelected[1] == true) {
                                // ordersController.reverse();
                              }
                              if (ordersController.isSelected[1] == false &&
                                  ordersController.isSelected[0] == true) {
                                // ordersController.reverse();
                              }
                            },
                            isSelected: ordersController.isSelected,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'All Orders',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Pending',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Obx(
                () => SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(children: [
                      Container(
                        height: 200.0,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Item : ${ordersController.ordersListDynamic[index].name!}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      'Order Quantity : ${ordersController.ordersListDynamic[index].quantity!}',
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      'Total : ₹ ${ordersController.ordersListDynamic[index].price! * ordersController.ordersListDynamic[index].quantity!}',
                                    ),
                                    const SizedBox(height: 10.0),
                                    const Text(
                                      'Order ready for pickup?',
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        height: 30,
                                        width: 120,
                                        child: RadioListTile(
                                            title: const Text('Yes'),
                                            dense: true,
                                            value: 'yes',
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            groupValue: (ordersController
                                                    .ordersListDynamic[index]
                                                    .pickup)
                                                .toString(),
                                            onChanged: (value) {
                                              ordersController.setOrderType(
                                                  value!, index);
                                            }),
                                      ),
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        height: 30,
                                        width: 120,
                                        child: RadioListTile(
                                            title: const Text('No'),
                                            dense: true,
                                            value: 'no',
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            groupValue: (ordersController
                                                    .ordersListDynamic[index]
                                                    .pickup)
                                                .toString(),
                                            onChanged: (value) {
                                              ordersController.setOrderType(
                                                  value!, index);
                                            }),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                  ]),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 110.0,
                                  height: 110.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(ordersController
                                          .ordersListDynamic[index].image!),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Text(
                                  'Status : ${ordersController.ordersListDynamic[index].status!}',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                    ]),
                    itemCount: ordersController.length(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
