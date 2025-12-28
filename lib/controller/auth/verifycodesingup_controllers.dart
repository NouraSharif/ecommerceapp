import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  gotToSuccessSignUp(String verifycode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifycodedata = VerifyCodeSignUpData();
  StatusRequest? statusRequest;
  String? email;

  @override
  checkCode() {}

  @override
  gotToSuccessSignUp(String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodedata.getData(email!, verifycode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Verifycode Not Correct!",
        );
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
