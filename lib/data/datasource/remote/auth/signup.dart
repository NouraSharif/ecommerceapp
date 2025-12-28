import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class SignupData {
  Crud crud = Crud();

  getData(String username, String email, String phone, String password) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
