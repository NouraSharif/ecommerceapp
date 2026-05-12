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
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[50],
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColor.primarycolor),

    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
      color: AppColor.primarycolor,
    ),
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
