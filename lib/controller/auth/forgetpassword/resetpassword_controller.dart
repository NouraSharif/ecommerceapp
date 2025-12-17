import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController? password;
  TextEditingController? repassword;

  bool isShowPassword = true;
  bool isReShowPassword = true;
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  showRePassword() {
    isReShowPassword = !isReShowPassword;
    update();
  }

  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(AppRoute.successResetPassword);
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }
}
