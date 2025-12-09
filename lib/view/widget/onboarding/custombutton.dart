import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(230, 45),
        backgroundColor: AppColor.blue,
        elevation: 4,
        shadowColor: AppColor.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        controller.next();
      },
      child: const Text("Continue", style: TextStyle(color: Colors.white)),
    );
  }
}
