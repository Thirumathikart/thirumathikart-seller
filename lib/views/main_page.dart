import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/nav_list.dart';
import 'package:thirumathikart_seller/controllers/main_controller.dart';
import 'package:thirumathikart_seller/views/home_page.dart';
import 'package:thirumathikart_seller/views/profile.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class Mainpage extends GetView<MainController> {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          appBar: appBar('Thirumathikart'),
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomePage(),
                HomePage(),
                ProfilePage(),
              ],
            ),
          ]),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.selectedIndex.value,
              onTap: (value) {
                if (value < 3) {
                  controller.selectedIndex.value = value;
                  controller.onPageChanged();
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Wrap(
                          children: moreList
                              .map(
                                (e) => ListTile(
                                    leading: e['icon'] as Widget,
                                    title: Text(e['title'] as String),
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(e['toRoute'].toString());
                                    }),
                              )
                              .toList()));
                }
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppTheme.navColor,
              unselectedItemColor: AppTheme.deSelected,
              selectedLabelStyle: TextStyle(color: AppTheme.textPrimary),
              showUnselectedLabels: false,
              selectedFontSize: 14,
              items: navList
                  .map((e) => BottomNavigationBarItem(
                        icon: e['icon'] as Widget,
                        label: e['title'] as String,
                      ))
                  .toList()))));
}
