import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
        print(val);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Text(
                onboardingList[i].title!,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 60),
              Image.asset(
                onboardingList[i].image!,
                height: 220,
                width: 215,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 40),
              Text(
                onboardingList[i].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
