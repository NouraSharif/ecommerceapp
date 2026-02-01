import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/home/custombuttomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder:
          (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              elevation: 20,
              backgroundColor: AppColor.appbarcolor,
              onPressed: () {
                Get.toNamed(AppRoute.cart);
              },
              child: Icon(
                Icons.shopping_basket_outlined,
                color: AppColor.primarycolor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              height: 60,
              color: AppColor.appbarcolor,
              shape: CircularNotchedRectangle(),
              notchMargin: 8,
              child: Row(
                children: [
                  Row(
                    children: [
                      CustomButtomAppBar(
                        icon: controller.buttonappbar[0]["icon"].icon,
                        color:
                            controller.currentpage == 0
                                ? AppColor.primarycolor
                                : null,
                        onPressed: () {
                          controller.changePage(0);
                        },
                      ),
                      CustomButtomAppBar(
                        icon: controller.buttonappbar[1]["icon"].icon,
                        color:
                            controller.currentpage == 1
                                ? AppColor.primarycolor
                                : null,
                        onPressed: () {
                          controller.changePage(1);
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtomAppBar(
                        icon: controller.buttonappbar[2]["icon"].icon,
                        color:
                            controller.currentpage == 2
                                ? AppColor.primarycolor
                                : null,
                        onPressed: () {
                          controller.changePage(2);
                        },
                      ),
                      CustomButtomAppBar(
                        icon: controller.buttonappbar[3]["icon"].icon,
                        color:
                            controller.currentpage == 3
                                ? AppColor.primarycolor
                                : null,
                        onPressed: () {
                          controller.changePage(3);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: controller.listpage.elementAt(controller.currentpage),
          ),
    );
  }
}
