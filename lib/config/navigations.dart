import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thirumathikart_seller/bindings/home_bindings.dart';
import 'package:thirumathikart_seller/bindings/order_bindings.dart';
import 'package:thirumathikart_seller/bindings/product_bindings.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/views/home_page.dart';
import 'package:thirumathikart_seller/views/order_page.dart';
import 'package:thirumathikart_seller/views/product_page.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.home,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.order,
          page: () => const OrderPage(),
          binding: OrderBindings(),
        ),
        GetPage(
          name: NavigationRoutes.product,
          page: () => const ProductPage(),
          binding: ProductBindings(),
        ),
      ];
}
