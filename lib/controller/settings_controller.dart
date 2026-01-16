import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingsPageController extends GetxController {
  MyServices myservices = Get.find();

  logout() {
    myservices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
