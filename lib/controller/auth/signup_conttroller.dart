import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class SignUpController extends GetxController {
  signUp();
  gotToSignIn();
}

class SignUpControllerImp extends SignUpController {
  TextEditingController? username;
  TextEditingController? email;
  TextEditingController? phone;
  TextEditingController? password;

  @override
  gotToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  signUp() {}

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
