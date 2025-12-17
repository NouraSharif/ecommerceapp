import 'package:ecommerceapp/controller/auth/signup_conttroller.dart'
    show SignUpControllerImp;
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/alertexitapp.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextsignupsignin.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.greyTitle),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: () async => await alertExitApp(),
        child: Form(
          key: controller.formstate,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                CustomTextTitleAuth(texttitle: "Welcome Back"),
                const SizedBox(height: 20),
                CustomTextBodyAuth(
                  textbody:
                      "SignUp With Your Email And Password Or\n Continue With Social Media",
                ),
                const SizedBox(height: 20),
                CustomTextFormAuth(
                  labeltext: "Username",
                  hinttext: "Enter Your username",
                  icondata: Icons.person_2_outlined,
                  mycontroller: controller.username,
                  validator: (String? p1) {
                    return validInput(p1!, 3, 20, "username");
                  },
                ),
                CustomTextFormAuth(
                  labeltext: "Email",
                  hinttext: "Enter Your Email",
                  icondata: Icons.email_outlined,
                  mycontroller: controller.email,
                  validator: (val) {
                    return validInput(val!, 11, 100, "email");
                  },
                ),
                CustomTextFormAuth(
                  labeltext: "Phone",
                  hinttext: "Enter Your Phone",
                  icondata: Icons.phone_android_outlined,
                  mycontroller: controller.phone,
                  validator: (String? p1) {
                    return validInput(p1!, 9, 20, "phone");
                  },
                  isNumber: true,
                ),
                CustomTextFormAuth(
                  labeltext: "Password",
                  hinttext: "Enter Your Password",
                  icondata: Icons.lock_open_outlined,
                  mycontroller: controller.password,
                  validator: (String? p1) {
                    return validInput(p1!, 5, 20, "password");
                  },
                ),
                const SizedBox(height: 33),
                CustomButtonAuth(
                  onPressed: () {
                    controller.signUp();
                  },
                  text: "Sign Up",
                ),
                CustomTextSignUpOrSignIn(
                  textone: "Have an account? ",
                  texttwo: "SignIn",
                  ontap: () {
                    controller.gotToSignIn();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
