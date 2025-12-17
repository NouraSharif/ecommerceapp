import 'package:ecommerceapp/controller/auth/login_controller.dart';
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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign In',
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
                Image.asset("assets/images/logo.png", height: 150),
                CustomTextTitleAuth(texttitle: "Welcome Back"),
                const SizedBox(height: 20),
                CustomTextBodyAuth(
                  textbody:
                      "SignIn With Your Email And Password Or\n Continue With Social Media",
                ),
                const SizedBox(height: 20),
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
                  labeltext: "Password",
                  hinttext: "Enter Your Password",
                  icondata: Icons.lock_open_outlined,
                  mycontroller: controller.password,
                  validator: (String? p1) {
                    return validInput(p1!, 5, 20, "password");
                  },
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 36),
                    child: Text("Forgot Password", textAlign: TextAlign.right),
                  ),
                ),
                const SizedBox(height: 13),
                CustomButtonAuth(
                  onPressed: () {
                    controller.login();
                  },
                  text: "Sign In",
                ),
                CustomTextSignUpOrSignIn(
                  textone: "Don't have an account? ",
                  texttwo: "SignUp",
                  ontap: () {
                    print("SignUp tapped");
                    controller.gotToSignUp();
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
