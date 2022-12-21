import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/views/orders_page.dart';
import 'package:thirumathikart_seller/views/product_page.dart';
import 'package:thirumathikart_seller/views/profile.dart';

class ScreenContants {
  List<Icon> iconItems = const [
    Icon(Icons.home_outlined),
    Icon(Icons.person_outline),
    Icon(Icons.shopping_cart_outlined),
  ];

  var widgetItems = const [
    ProductPage(),
    ProfilePage(),
    OrdersPage(),
  ];

  var navItems = const [
    {
      'title': 'Products',
      'icon': Icon(Icons.home_outlined),
      'widget': ProductPage(),
    },
    {
      'title': 'Profile',
      'icon': Icon(Icons.person_outline),
      'widget': ProfilePage(),
    },
    {
      'title': 'Orders',
      'icon': Icon(Icons.shopping_cart_outlined),
      'widget': OrdersPage(),
    },
  ];
}
