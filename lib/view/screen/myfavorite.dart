import 'package:ecommerceapp/controller/favorite/myfavorite_controller.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: GetBuilder<MyFavoriteControllerImp>(
        builder:
            (controller) => Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  CustomAppBar(
                    titleappBar: "Find Product",
                    myController: controller.search,
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onPressedfavorite: () {
                      Get.toNamed(AppRoute.myfavorite);
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  SizedBox(height: 20),
                  !controller.isSearch
                      ? CustomListFavoriteItems()
                      : ListSearchItems(
                        listSearchItems:
                            controller.searchItems
                                .map((e) => ItemsModel.fromJson(e))
                                .toList(),
                      ),
                ],
              ),
            ),
      ),
    );
  }
}
