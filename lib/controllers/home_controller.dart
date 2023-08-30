import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';

class HomeController extends GetxController {
 void logout()async{
    Get.offAllNamed(NavigationRoutes.loginRoute);
    // navigateToLogin();
  }

}
