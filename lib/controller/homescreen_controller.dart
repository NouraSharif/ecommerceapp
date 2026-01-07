import 'package:ecommerceapp/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
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
    Center(child: Text("profile")),
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
