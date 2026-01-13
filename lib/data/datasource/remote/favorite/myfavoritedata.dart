import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class MyFavoriteData {
  Crud crud = Crud();

  getData(String usersid) async {
    var response = await crud.postData(AppLink.viewfavorite, {
      "usersid": usersid,
    });
    return response.fold((l) => (l), (r) => (r));
  }

  deletefromfavorite(String favoriteid) async {
    var response = await crud.postData(AppLink.deletefromfavorite, {
      "favoriteid": favoriteid,
    });
    return response.fold((l) => (l), (r) => (r));
  }
}
