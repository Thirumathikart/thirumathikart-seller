import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final selectedIndex = 0.obs;
  late PageController pageController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void onInit() {
    pageController = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged() {
    pageController.animateToPage(selectedIndex.value,
        duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
  }
}
