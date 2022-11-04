import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/controllers/product_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsController = Get.find<ProductController>();
    final productsListMain = Get.arguments;
    if (productsController.flag.value) {
      productsController.copy(productsListMain);
      productsController.switchFlag();
    }
    return Scaffold(
      appBar: appBar('Product Page'),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Obx(
                () => SizedBox(
                  height: MediaQuery.of(context).size.height - 60,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(children: [
                      Container(
                        height: 170.0,
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
                            Container(
                              width: 110.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(productsController
                                      .productsListDynamic[index].image!),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${productsController.productsListDynamic[index].name!}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      '₹ ${productsController.productsListDynamic[index].price!}',
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      '${productsController.productsListDynamic[index].details!}',
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      '${productsController.productsListDynamic[index].parentName!}',
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => {
                                            productsController
                                                .decreaseQtyOfSelectedItem(
                                                    index,
                                                    productsController
                                                            .productsListDynamic[
                                                        index])
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 12,
                                          ),
                                        ),
                                        Text(productsController
                                            .productsListDynamic[index].quantity
                                            .toString()),
                                        IconButton(
                                          onPressed: () => {
                                            productsController
                                                .increaseQtyOfSelectedItem(
                                                    index)
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            size: 12,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => {
                                            productsController.deleteItem(index)
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color:
                                                Color.fromARGB(255, 84, 84, 84),
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                            SizedBox(
                              width: 30.0,
                              child: TextButton(
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ),
                                onPressed: () => {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ]),
                    itemCount: productsController.length(),
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
