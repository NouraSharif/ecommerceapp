import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class LoginController extends GetxController {
  login();
  gotToSignUp();
}

class LoginControllerImp extends LoginController {
  TextEditingController? email;
  TextEditingController? password;

  @override
  gotToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  login() {}

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
