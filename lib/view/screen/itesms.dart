import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/items/customlistitems.dart';
import 'package:ecommerceapp/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ListView(
          children: [
            CustomAppBar(
              onPressedSearch: () {},
              titleappBar: "Find Product",
              onPressedfavorite: () {
                Get.toNamed(AppRoute.myfavorite);
              },
            ),
            ListCategoriesItems(),
            CustomListItems(),
          ],
        ),
      ),
    );
  }
}
