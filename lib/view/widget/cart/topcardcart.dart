import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final int itemscount;
  const TopCardCart({super.key, required this.itemscount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColor.appbarcolor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "You Have $itemscount Items In Your Cart",
        style: TextStyle(
          color: AppColor.primarycolor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
