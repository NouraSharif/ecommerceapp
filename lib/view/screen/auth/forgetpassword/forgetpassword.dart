import 'package:ecommerceapp/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.greyTitle),
        ),
        elevation: 0,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder:
            (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.formstate,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(texttitle: "Check Email"),
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
                        validator: (val) {
                          return validInput(val!, 11, 100, "email");
                        },
                      ),

                      const SizedBox(height: 33),
                      CustomButtonAuth(
                        onPressed: () {
                          controller.gotToVerifyCode();
                        },
                        text: "Check",
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
