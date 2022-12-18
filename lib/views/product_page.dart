import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/controllers/product_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/models/product.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(NavigationRoutes.addProduct),
          backgroundColor: AppTheme.bg,
          child: Icon(
            Icons.add,
            color: AppTheme.unSelected,
          ),
        ),
        appBar: appBar('Product Page'),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Expanded(
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      height: MediaQuery.of(context).size.height - 90,
                      child: ListView.builder(
                        itemBuilder: (ctx, index) => Column(children: [
                          Container(
                            height: 190 >
                                    ((MediaQuery.of(context).size.height - 60) /
                                        4.3)
                                ? 190
                                : ((MediaQuery.of(context).size.height - 60) /
                                    4.3),
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 8, bottom: 8),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.textPrimary),
                              borderRadius: BorderRadius.circular(10),
                              color: AppTheme.textSecondary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(controller
                                              .productsListDynamic[index]
                                              .image!),
                                        ),
                                      ),
                                    )),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            '${controller.productsListDynamic[index].name!}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            '₹ ${controller.productsListDynamic[index].price!}',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            '${controller.productsListDynamic[index].details!}',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            '${controller.productsListDynamic[index].parentName!}',
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text('Stocks Available: '),
                                            Text(controller
                                                .productsListDynamic[index]
                                                .quantity
                                                .toString()),
                                          ],
                                        )
                                      ]),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 30.0,
                                      child: TextButton(
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () => {
                                          Get.toNamed(
                                              NavigationRoutes.editProduct,
                                              arguments: Product(
                                                  name: 'product_name',
                                                  price: '100',
                                                  imageUrl:
                                                      'https://aaveg.in/22/assets/images/team/110120090.jpg',
                                                  quantity: '100',
                                                  description: 'okay',
                                                  category: 'Two'))
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                        itemCount: controller.length(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
