import 'package:ecommerceapp/controller/homescreen.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/home/custombuttomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
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
              onPressed: () {},
              child: Icon(
                Icons.shopping_basket_outlined,
                color: AppColor.primarycolor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              height: 70,
              color: AppColor.appbarcolor,
              shape: CircularNotchedRectangle(),
              notchMargin: 8,
              child: Row(
                children: [
                  Row(
                    children: [
                      CustomButtomAppBar(
                        title: "home",
                        icon: Icons.home,
                        color:
                            controller.currentpage == 0
                                ? AppColor.primarycolor
                                : null,
                        onPressed: () {
                          controller.changePage(0);
                        },
                      ),
                      CustomButtomAppBar(
                        title: "settings",
                        icon: Icons.settings,
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
                        title: "favorit",
                        icon: Icons.shopping_basket_outlined,
                        color:
                            controller.currentpage == 2
                                ? AppColor.primarycolor
                                : null,
                        onPressed: () {
                          controller.changePage(2);
                        },
                      ),
                      CustomButtomAppBar(
                        title: "profile",
                        icon: Icons.person_4_outlined,
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
