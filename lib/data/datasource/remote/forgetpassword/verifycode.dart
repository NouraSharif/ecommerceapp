import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class VerifyCodeData {
  Crud crud = Crud();

  getData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifycode, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
