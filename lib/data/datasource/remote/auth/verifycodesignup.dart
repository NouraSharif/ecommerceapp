import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud = Crud();
  getData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
