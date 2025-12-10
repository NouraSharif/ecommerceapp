import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/view/widget/onboarding/custombutton.dart';
import 'package:ecommerceapp/view/widget/onboarding/customslider.dart';
import 'package:ecommerceapp/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 5, child: const CustomSliderOnBoarding()),
            Expanded(
              flex: 2,
              child: Column(
                children: const [
                  CustomDotControllerOnBoarding(),
                  SizedBox(height: 70),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
