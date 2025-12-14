import 'package:ecommerceapp/controller/auth/signup_conttroller.dart'
    show SignUpControllerImp;
import 'package:ecommerceapp/core/constant/color.dart';
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
      body: Container(
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
            ),
            CustomTextFormAuth(
              labeltext: "Email",
              hinttext: "Enter Your Email",
              icondata: Icons.email_outlined,
              mycontroller: controller.email,
            ),
            CustomTextFormAuth(
              labeltext: "Phone",
              hinttext: "Enter Your Phone",
              icondata: Icons.phone_android_outlined,
              mycontroller: controller.phone,
            ),
            CustomTextFormAuth(
              labeltext: "Password",
              hinttext: "Enter Your Password",
              icondata: Icons.lock_open_outlined,
              mycontroller: controller.password,
            ),
            const SizedBox(height: 33),
            CustomButtonAuth(onPressed: () {}, text: "Sign Up"),
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
    );
  }
}
