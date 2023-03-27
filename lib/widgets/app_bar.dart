import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/views/login.dart';

PreferredSizeWidget appBar(
        {required String label,
        required BuildContext context,
        bool showLogout = false}) =>
    AppBar(
      backgroundColor: AppTheme.bg,
      elevation: 1,
      iconTheme: IconThemeData(color: AppTheme.textPrimary),
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
            fontSize: 25),
      ),
      centerTitle: true,
      actions: showLogout
          ? [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                icon: const Icon(Icons.logout),
              ),
            ]
          : [],
    );
