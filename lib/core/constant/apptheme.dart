import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'PlayfairDisplay',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(height: 2, color: AppColor.grey, fontSize: 16),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(height: 2, color: AppColor.grey, fontSize: 16),
  ),
);
