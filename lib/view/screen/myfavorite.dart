import 'package:ecommerceapp/controller/favorite/myfavorite_controller.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());

    return Scaffold(
      body:
      //HandlingDataView(
      //statusRequest: controller.statusRequest,
      //widget:
      Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            CustomAppBar(
              onPressedSearch: () {},
              titleappBar: "Find Product",
              onPressed: () {},
              onPressedfavorite: () {
                Get.toNamed(AppRoute.myfavorite);
              },
            ),
            SizedBox(height: 20),
            CustomListFavoriteItems(),
          ],
        ),
      ),
    );
  }
}
