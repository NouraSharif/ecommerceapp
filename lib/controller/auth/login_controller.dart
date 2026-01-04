import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class LoginController extends GetxController {
  login();
  gotToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData logindata = LoginData();
  StatusRequest? statusRequest = StatusRequest.none;

  MyServices myservices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController? email;
  TextEditingController? password;

  bool isShowPassword = true;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  gotToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.getData(email!.text, password!.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == 'success') {
          myservices.sharedPreferences.setString(
            "id",
            response['data']['users_id'].toString(),
          );

          myservices.sharedPreferences.setString(
            "username",
            response['data']['users_name'],
          );
          myservices.sharedPreferences.setString(
            "email",
            response['data']['users_email'],
          );
          myservices.sharedPreferences.setString(
            "phone",
            response['data']['users_phone'],
          );
          myservices.sharedPreferences.setBool("step2", true);
          Get.offNamed(AppRoute.home);
        } else {
          Get.defaultDialog(
            title: "warning",
            middleText: "Email OR Password Not Correct",
          );
        }
        update();
      }
    }
  }

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    /*  FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("FCM Token for Web: $token");
    });
*/
    super.onInit();
  }
}
