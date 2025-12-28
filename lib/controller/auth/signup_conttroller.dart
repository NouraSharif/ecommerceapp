import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();

  gotToSignIn();
}

class SignUpControllerImp extends SignUpController {
  SignupData signupdata = SignupData();
  List data = [];
  StatusRequest? statusRequest;
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController? username;
  TextEditingController? email;
  TextEditingController? phone;
  TextEditingController? password;

  bool isShowPassword = true;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  gotToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupdata.getData(
        username!.text,
        email!.text,
        phone!.text,
        password!.text,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.offNamed(
            AppRoute.verifyCodeSignUp,
            arguments: {"email": email!.text},
          );
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email OR Phone Already Exists",
          );
        }
        update();
      } else {}
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
