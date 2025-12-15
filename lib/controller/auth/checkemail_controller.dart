import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class CheckEmailController extends GetxController {
  checkemail();
  gotToVerifyCodeSignUp();
}

class CheckEmailControllerImp extends CheckEmailController {
  TextEditingController? email;

  @override
  gotToVerifyCodeSignUp() {
    Get.offNamed(AppRoute.verifyCodeSignUp);
  }

  @override
  checkemail() {}

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
}
