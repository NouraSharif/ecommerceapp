import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ForgetPasswordController extends GetxController {
  gotToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkemaildata = CheckEmailData();
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController? email;

  @override
  gotToVerifyCode() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemaildata.getData(email!.text);
      print(response);
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.verifyCode, arguments: {"email": email!.text});
        } else {
          Get.defaultDialog(title: 'warning', middleText: 'Email Not Found!');
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
}
