import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final step1 = myServices.sharedPreferences.getBool("step1") ?? false;
    final step2 = myServices.sharedPreferences.getBool("step2") ?? false;

    // إذا خلّص OnBoarding ومسجّل دخول
    if (step1 && step2) {
      if (route != AppRoute.home) {
        return const RouteSettings(name: AppRoute.home);
      }
    }

    // إذا خلّص OnBoarding لكن مش مسجّل دخول
    if (step1 && !step2) {
      if (route != AppRoute.login) {
        return const RouteSettings(name: AppRoute.login);
      }
    }

    // غير هيك (أول مرة)
    return null;
  }
}
/*

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool("step2") == true) {
      return RouteSettings(name: AppRoute.home);
    }
    if (myServices.sharedPreferences.getBool("step1") == true) {
      return RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
*/