import 'package:ecommerceapp/controller/auth/checkemail_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Check Email',
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
            CustomTextTitleAuth(texttitle: "Success Singup"),
            const SizedBox(height: 20),
            CustomTextBodyAuth(
              textbody:
                  "Please Enter Your Email Address To Recive  \n Verication Code.",
            ),
            const SizedBox(height: 20),

            CustomTextFormAuth(
              labeltext: "Email",
              hinttext: "Enter Your Email",
              icondata: Icons.email_outlined,
              mycontroller: controller.email,
            ),

            const SizedBox(height: 33),
            CustomButtonAuth(
              onPressed: () {
                controller.gotToVerifyCodeSignUp();
              },
              text: "Check",
            ),
          ],
        ),
      ),
    );
  }
}
