import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/api_constants.dart';
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
        body: controller.obx(
          (state) => ListView.builder(
            itemBuilder: (ctx, index) => Column(children: [
              Container(
                height: 190 > ((MediaQuery.of(context).size.height - 60) / 4.3)
                    ? 190
                    : ((MediaQuery.of(context).size.height - 60) / 4.3),
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
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  '${ApiConstants.orderBaseUrl}/${state[index].imageUrl!}',
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ))),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                '${state[index].product!.title}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                '₹ ${state[index].product!.price}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                '${state[index].product!.description}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                '${state[index].product!.title}',
                              ),
                            ),
                            Row(
                              children: [
                                const Text('Stocks Available: '),
                                Text(
                                  '${state[index].product!.stock}',
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
                              Get.toNamed(NavigationRoutes.editProduct,
                                  arguments: Product(
                                      name: 'product_name',
                                      price: '100',
                                      imageUrl:
                                          'https://aaveg.in/22/assets/images/team/110120080.jpg',
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
            itemCount: state!.length,
          ),
        ),
        // body: SingleChildScrollView(
        //   physics: const NeverScrollableScrollPhysics(),
        //   child: Column(
        //     children: [
        //       SingleChildScrollView(
        //         child: controller.obx(
        //           (state) => Expanded(
        //             child: Container(
        //               padding: const EdgeInsets.only(bottom: 20),
        //               height: MediaQuery.of(context).size.height - 90,
        //               child: ListView.builder(
        //                 itemBuilder: (ctx, index) => Column(children: [
        //                   Container(
        //                     height: 190 >
        //                             ((MediaQuery.of(context).size.height - 60) /
        //                                 4.3)
        //                         ? 190
        //                         : ((MediaQuery.of(context).size.height - 60) /
        //                             4.3),
        //                     margin: const EdgeInsets.only(
        //                         left: 10, right: 10, top: 8, bottom: 8),
        //                     padding: const EdgeInsets.all(10.0),
        //                     decoration: BoxDecoration(
        //                       border: Border.all(color: AppTheme.textPrimary),
        //                       borderRadius: BorderRadius.circular(10),
        //                       color: AppTheme.textSecondary,
        //                     ),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         Flexible(
        //                             flex: 1,
        //                             child: Container(
        //                               decoration: BoxDecoration(
        //                                 borderRadius:
        //                                     BorderRadius.circular(5.0),
        //                                 image: DecorationImage(
        //                                   fit: BoxFit.cover,
        //                                   image: AssetImage('https://thirumathikart.nitt.edu/api/product/${state![index].imageUrl}'),
        //                                 ),
        //                               ),
        //                             )),
        //                         const SizedBox(width: 10.0),
        //                         Expanded(
        //                           child: Column(
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.center,
        //                               children: [
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(bottom: 10),
        //                                   child: Text(
        //                                     '${state[index].product!.title}',
        //                                     style: const TextStyle(
        //                                         fontWeight: FontWeight.bold,
        //                                         fontSize: 16.0),
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(bottom: 10),
        //                                   child: Text(
        //                                     '₹ ${state[index].product!.price}',
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(bottom: 10),
        //                                   child: Text(
        //                                     '${state[index].product!.description}',
        //                                   ),
        //                                 ),
        //                                 Padding(
        //                                   padding:
        //                                       const EdgeInsets.only(bottom: 10),
        //                                   child: Text(
        //                                     '${state[index].product!.title}',
        //                                   ),
        //                                 ),
        //                                 Row(
        //                                   children: [
        //                                     const Text('Stocks Available: '),
        //                                     Text(
        //                                       '${state[index].product!.quantity}',
        //                                     ),
        //                                   ],
        //                                 )
        //                               ]),
        //                         ),
        //                         Column(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           children: [
        //                             SizedBox(
        //                               width: 30.0,
        //                               child: TextButton(
        //                                 child: const Icon(
        //                                   Icons.edit,
        //                                   color: Colors.grey,
        //                                 ),
        //                                 onPressed: () => {
        //                                   Get.toNamed(
        //                                       NavigationRoutes.editProduct,
        //                                       arguments: Product(
        //                                           name: 'product_name',
        //                                           price: '100',
        //                                           imageUrl:
        //                                               'https://aaveg.in/22/assets/images/team/110120080.jpg',
        //                                           quantity: '100',
        //                                           description: 'okay',
        //                                           category: 'Two'))
        //                                 },
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ]),
        //                 itemCount: controller.length(),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      );
}
