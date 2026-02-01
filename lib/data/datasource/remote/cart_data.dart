import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class CartData {
  Crud crud = Crud();

  add(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.addtocart, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  remove(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.removecart, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getcountitems(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.getcountitems, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  view(String usersid) async {
    var response = await crud.postData(AppLink.viewcart, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
