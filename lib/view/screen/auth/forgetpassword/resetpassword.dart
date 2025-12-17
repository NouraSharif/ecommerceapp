import 'package:ecommerceapp/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.greyTitle),
        ),
        elevation: 0,
      ),
      body: Form(
        key: controller.formstate,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              CustomTextTitleAuth(texttitle: "New Password"),
              const SizedBox(height: 18),
              CustomTextBodyAuth(textbody: "Please Enter New Password"),
              const SizedBox(height: 16),
              GetBuilder<ResetPasswordControllerImp>(
                builder:
                    (controller) => Column(
                      children: [
                        CustomTextFormAuth(
                          labeltext: "Password",
                          hinttext: "Enter Your Password",
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
                      ],
                    ),
              ),
              GetBuilder<ResetPasswordControllerImp>(
                builder:
                    (controller) => CustomTextFormAuth(
                      labeltext: "rePassword",
                      hinttext: "Re Enter Your Password",
                      obscureText: controller.isReShowPassword,
                      icondata:
                          controller.isReShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,

                      onTap: controller.showRePassword,
                      mycontroller: controller.repassword,
                      validator: (String? p1) {
                        return validInput(p1!, 5, 20, "password");
                      },
                    ),
              ),
              const SizedBox(height: 25),
              CustomButtonAuth(
                onPressed: () {
                  controller.goToSuccessResetPassword();
                },
                text: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
