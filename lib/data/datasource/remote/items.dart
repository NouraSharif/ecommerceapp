import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class ItemsData {
  Crud crud = Crud();
  getAllItems(String id, String usersid) async {
    var response = await crud.postData(AppLink.items, {
      "id": id,
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
