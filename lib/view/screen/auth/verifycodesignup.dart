import 'package:ecommerceapp/controller/auth/verifycodesingup_controllers.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller = Get.put(
      VerifyCodeSignUpControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Verification Code',
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
            CustomTextTitleAuth(texttitle: "Check Email"),
            const SizedBox(height: 20),
            CustomTextBodyAuth(
              textbody: "Please Enter The Digit Code Sent  Or\n Your Email",
            ),
            const SizedBox(height: 20),
            OtpTextField(
              borderRadius: BorderRadius.circular(15),
              borderWidth: 4,
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.gotToSuccessSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
