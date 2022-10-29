import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thirumathikart_seller/bindings/home_bindings.dart';
import 'package:thirumathikart_seller/bindings/add_edit_products_binding.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/views/add_edit_product_page.dart';
import 'package:thirumathikart_seller/views/home_page.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.home,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.editProduct,
          page: AddEditProductPage.new,
          binding: AddEditProductsBindings(),
        ),
        GetPage(
          name: NavigationRoutes.addProduct,
          page: AddEditProductPage.new,
          binding: AddEditProductsBindings(),
        ),
      ];
}
