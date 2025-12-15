import 'package:ecommerceapp/controller/auth/successsignup_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(
      SuccessSignUpControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Success'), centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 150,
              color: AppColor.blue,
            ),
          ),
          Text(
            'Your Password Has Been Reset Successfully!',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(color: AppColor.greyTitle),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: CustomButtonAuth(
              onPressed: () {
                controller.gotToPageLogin();
              },
              text: "Go To Login",
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
