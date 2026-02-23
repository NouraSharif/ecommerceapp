import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextsignupsignin.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '9'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.greyTitle),
        ),
        elevation: 0,
      ),
      body: // WillPopScope(
      // onWillPop: () async => await alertExitApp(),
      // child:
      GetBuilder<LoginControllerImp>(
        builder:
            (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: Form(
                key: controller.formstate,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      Image.asset("assets/images/logo.png", height: 150),
                      CustomTextTitleAuth(texttitle: "10".tr),
                      const SizedBox(height: 20),
                      CustomTextBodyAuth(textbody: "11".tr),
                      const SizedBox(height: 20),
                      CustomTextFormAuth(
                        labeltext: "18".tr,
                        hinttext: "12".tr,
                        icondata: Icons.email_outlined,
                        mycontroller: controller.email,
                        validator: (val) {
                          return validInput(val!, 11, 100, "email");
                        },
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder:
                            (controller) => CustomTextFormAuth(
                              labeltext: "19".tr,
                              hinttext: "13".tr,
                              obscureText: controller.isShowPassword,
                              icondata:
                                  controller.isShowPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,

                              onTap: controller.showPassword,
                              mycontroller: controller.password,
                              validator: (String? p1) {
                                return validInput(p1!, 5, 20, "password");
                              },
                            ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 36),
                          child: Text("14".tr, textAlign: TextAlign.right),
                        ),
                      ),
                      const SizedBox(height: 13),
                      CustomButtonAuth(
                        onPressed: () {
                          controller.login();
                        },
                        text: "15".tr,
                      ),
                      CustomTextSignUpOrSignIn(
                        textone: "16".tr,
                        texttwo: "17".tr,
                        ontap: () {
                          controller.gotToSignUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
