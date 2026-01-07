import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class VerifyCodeController extends GetxController {
  gotToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeData verifycodedata = VerifyCodeData();
  StatusRequest? statusRequest;

  String? email;

  @override
  gotToResetPassword(String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodedata.getData(email!, verifycode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email!});
      } else {
        Get.defaultDialog(
          title: 'warning',
          middleText: 'VerifyCode Not Correct!',
        );
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments?['email'];
    super.onInit();
  }
}
