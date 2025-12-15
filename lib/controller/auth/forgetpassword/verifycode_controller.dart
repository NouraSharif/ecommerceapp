import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  gotToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  TextEditingController? verifycode;

  @override
  checkCode() {}

  @override
  gotToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    verifycode = TextEditingController();
    super.onInit();
  }
}
