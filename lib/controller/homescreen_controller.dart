import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomeScreen extends GetxController {
  changePage(int value);
}

class HomeScreenControllerImp extends HomeScreen {
  int currentpage = 0;
  List<Widget> listpage = [
    const HomePage(),
    Center(child: Text("Settings")),
    Center(child: Text("favorit")),
    SettingsPage(),
  ];

  List buttonappbar = [
    {"icon": Icon(Icons.home)},
    {"icon": Icon(Icons.notifications_active_outlined)},
    {"icon": Icon(Icons.person_pin_sharp)},
    {"icon": Icon(Icons.settings)},
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  changePage(value) {
    currentpage = value;
    update();
  }
}
