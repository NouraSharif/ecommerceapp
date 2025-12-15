import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  gotToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  TextEditingController? email;

  @override
  gotToVerifyCode() {
    Get.offNamed(AppRoute.verifyCode);
  }

  @override
  checkemail() {}

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
}
