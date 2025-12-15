import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class SuccessSignUpController extends GetxController {
  gotToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  gotToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
