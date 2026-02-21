import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.appbarcolor,
        title: const Text(
          'Address',
          style: TextStyle(color: AppColor.appbarcolor),
        ),
        backgroundColor: AppColor.primarycolor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primarycolor,
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: Icon(Icons.add, color: AppColor.appbarcolor),
      ),
      body: SizedBox.expand(
        child: Image.asset(AppImageAsset.map, fit: BoxFit.cover),
      ),
    );
  }
}
