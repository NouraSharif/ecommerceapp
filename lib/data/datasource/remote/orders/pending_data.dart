import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class OrdersPendingData {
  Crud crud = Crud();

  ordersPending(String userId) async {
    var response = await crud.postData(AppLink.pending, {"usersid": userId});
    return response.fold((l) => l, (r) => r);
  }
}
