import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordData resetpassworddata = ResetPasswordData();
  StatusRequest? statusRequest;

  String? email;

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
  goToSuccessResetPassword() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      if (password!.text != repassword!.text) {
        Get.defaultDialog(title: 'warning', middleText: 'Password Not Match!');
        return;
      }

      statusRequest = StatusRequest.loading;
      update();

      var response = await resetpassworddata.getData(email!, password!.text);

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(title: 'warning', middleText: 'Try Again!');
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments?['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }
}
