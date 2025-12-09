import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder:
          (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onboardingList.length,
                (index) => AnimatedContainer(
                  width: controller.currentpage == index ? 20 : 5,
                  height: 6,
                  margin: const EdgeInsets.only(right: 7),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.blue,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
