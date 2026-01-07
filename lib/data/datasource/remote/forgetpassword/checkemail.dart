import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class CheckEmailData {
  Crud crud = Crud();

  getData(String email) async {
    var response = await crud.postData(AppLink.checkemail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
