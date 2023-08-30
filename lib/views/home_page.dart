import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';
import 'package:thirumathikart_seller/models/product.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.asset(
                'assets/tklogo.jpeg', // Replace with the actual path to your logo asset
                width: 50, // Adjust the width as needed
                height: 50, // Adjust the height as needed
              ),
              const SizedBox(width: 10), // Add spacing between logo and title
              const Text('Home',
              style: TextStyle(color: Colors.black,
              fontWeight:FontWeight.bold)),
            ],
          ),
        ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     Get.toNamed(NavigationRoutes.editProduct,
              //         arguments: Product(
              //             name: 'product_name',
              //             price: '100',
              //             imageUrl:
              //                 'https://aaveg.in/22/assets/images/team/110120090.jpg',
              //             quantity: '100',
              //             description: 'okay',
              //             category: 'Two'));
              //   },
              //   child: const Text('Edit Product'),
              // ),
              const SizedBox(height: 16), // Add vertical spacing between buttons
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(NavigationRoutes.addProduct,
                      arguments: Product());
                },
                child: const Text('Add Product'),
              ),
              // const SizedBox(height: 16), // Add vertical spacing between buttons
              // ElevatedButton(
              //   onPressed: () {
              //     Get.toNamed(NavigationRoutes.product);
              //   },
              //   child: const Text('Product List'),
              // ),
              const SizedBox(height: 16), // Add vertical spacing between buttons
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(NavigationRoutes.order);
                },
                child: const Text('Order List'),
              ),
              // const SizedBox(height: 16), // Add vertical spacing between buttons
              // ElevatedButton(
              //   onPressed: () {
              //     Get.toNamed(NavigationRoutes.map);
              //   },
              //   child: const Text('Tracking Map'),
              // ),
              const SizedBox(height: 16), // Add vertical spacing between buttons
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(NavigationRoutes.profileRoute);
                },
                child: const Text('Seller Profile'),
              ),
              const SizedBox(height: 16), 
              // Add vertical spacing between buttons
              //  ElevatedButton.icon(
                ElevatedButton.icon(
                onPressed: () {
                  // Implement your logout logic here
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Perform logout actions, e.g., clear session
                              Navigator.of(context).pop();
                              // Add additional logic, e.g., navigate to login screen
                              Get.offAllNamed(NavigationRoutes.loginRoute);
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ],
          ),
        ),
       
      );
}
