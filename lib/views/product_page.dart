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
                          height: 180 >
                                  ((MediaQuery.of(context).size.height - 60) /
                                      4.3)
                              ? 180
                              : ((MediaQuery.of(context).size.height - 60) /
                                  4.3),
                          margin: const EdgeInsets.only(left: 10, right: 10),
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
                              Container(
                                width: 110.0,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(controller
                                        .productsListDynamic[index].image!),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          IconButton(
                                            onPressed: () => {
                                              controller.decreaseQtyOfSelectedItem(
                                                  index,
                                                  controller
                                                          .productsListDynamic[
                                                      index])
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 25,
                                            ),
                                          ),
                                          Text(controller
                                              .productsListDynamic[index]
                                              .quantity
                                              .toString()),
                                          IconButton(
                                            onPressed: () => {
                                              controller
                                                  .increaseQtyOfSelectedItem(
                                                      index)
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              size: 25,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () =>
                                                {controller.deleteItem(index)},
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Color.fromARGB(
                                                  255, 84, 84, 84),
                                              size: 25,
                                            ),
                                          ),
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
                        const Divider(),
                      ]),
                      itemCount: controller.length(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
