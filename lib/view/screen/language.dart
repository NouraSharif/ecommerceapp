import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/lcalization/changelocale.dart';
import 'package:ecommerceapp/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            CustomButtonLang(
              text: "ar".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
            const SizedBox(height: 10),
            CustomButtonLang(
              text: "en".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
