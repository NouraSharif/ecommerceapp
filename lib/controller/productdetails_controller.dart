import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  //CartController cartController = Get.put(CartController());
  CartData cartData = CartData();
  MyServices myServices = Get.find();

  late ItemsModel itemsModel;

  StatusRequest statusRequest = StatusRequest.none;

  int itemscount = 0;
  @override
  void onInit() {
    initialData();
    getCountItems(itemsModel.itemsId.toString());
    super.onInit();
  }

  List subitems = [
    {"name": "Red", "id": "1", "active": "1"},
    {"name": "Blue", "id": "2", "active": "0"},
    {"name": "Yellow", "id": "3", "active": "0"},
  ];

  @override
  initialData() {
    itemsModel = Get.arguments!["itemsmodel"];
  }

  addToCart(String itemsid) async {
    var response = await cartData.add(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    return response;
  }

  removeFromCart(String itemsid) async {
    var response = await cartData.remove(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    return response;
  }

  add() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addToCart(itemsModel.itemsId!.toString());
    itemscount++;
    statusRequest = handlingData(response);
    update();
  }

  remove() async {
    statusRequest = StatusRequest.loading;
    update();
    if (itemscount > 0) {
      var response = await removeFromCart(itemsModel.itemsId!.toString());
      itemscount--;
      statusRequest = handlingData(response);
    }

    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getcountitems(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        return response['data'];
      }
    }
    update();
  }
}
