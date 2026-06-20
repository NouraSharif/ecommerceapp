import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class CheckoutData {
  Crud crud = Crud();

  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }

}
