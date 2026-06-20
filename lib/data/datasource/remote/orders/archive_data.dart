import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class OrdersArchiveData {
  Crud crud = Crud();

  ordersArchive(String userId) async {
    var response = await crud.postData(AppLink.archive, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
