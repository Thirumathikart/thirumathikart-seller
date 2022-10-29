import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';

PreferredSizeWidget appBar(String label) => AppBar(
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
    );
