import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class OnboardingComtroller extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnboardingComtroller {
  late PageController pageController;

  int currentpage = 0;
  @override
  next() {
    currentpage++;
    if (currentpage > onboardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
    }
    pageController.animateToPage(
      currentpage,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
  }

  @override
  onPageChanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
