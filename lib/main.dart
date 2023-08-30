import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/navigations.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/controllers/login_controller.dart';
import 'package:thirumathikart_seller/services/api_service.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  Get.put(LoginController());
  runApp(const Thirumathikart());
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageServices().initStorage());
  await Get.putAsync(() => ApiServices().initApi());
}

class Thirumathikart extends GetView<LoginController> {
  const Thirumathikart({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
            textTheme:
                GoogleFonts.brawlerTextTheme(Theme.of(context).textTheme)),
        debugShowCheckedModeBanner: false,
        initialRoute: controller.userTokenFetch()
            ? NavigationRoutes.home
            : NavigationRoutes.loginRoute,
        getPages: NavigationPages.getPages(),
      );
}
