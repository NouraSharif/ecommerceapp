import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/home/customcurdhome.dart';
import 'package:ecommerceapp/view/widget/home/customtitlehome.dart';
import 'package:ecommerceapp/view/widget/home/listcategorieshome.dart';
import 'package:ecommerceapp/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.all(16),
                child: ListView(
                  children: [
                    CustomAppBar(
                      titleappBar: "Find Product",
                      onPressedSearch: () {},
                      onPressed: () {},
                      onPressedfavorite: () {
                        Get.toNamed(AppRoute.myfavorite);
                      },
                    ),
                    SizedBox(height: 15),
                    CustomCurdHome(
                      title: "A Summer Surprise",
                      body: "Cashback 20%",
                    ),
                    SizedBox(height: 5),
                    CustomTitleHome(title: "Categories"),
                    ListCategoriesHome(),
                    CustomTitleHome(title: "Product For You"),
                    ListItemsHome(),
                    CustomTitleHome(title: "offer"),
                    ListItemsHome(),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
