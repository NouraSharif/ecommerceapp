import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/linkapi.dart';

class AddressData {
  Crud crud = Crud();

  getData(String usersid) async {
    var response = await crud.postData(AppLink.getaddress, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addAddress(
    String usersid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(AppLink.addaddress, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressid) async {
    var response = await crud.postData(AppLink.deleteadderss, {
      "addressid": addressid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
