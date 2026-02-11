import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/items/customlistitems.dart';
import 'package:ecommerceapp/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: GetBuilder<ItemsControllerImp>(
        builder:
            (controller) => Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                  SizedBox(height: 15),
                  !controller.isSearch
                      ? Column(
                        children: [ListCategoriesItems(), CustomListItems()],
                      )
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
