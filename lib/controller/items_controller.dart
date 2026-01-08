import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/data/datasource/remote/items.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String categoriesid);
  getItems(String categoriesid);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  late String categoriesid;

  ItemsData itemsData = ItemsData();
  List items = [];

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    if (Get.arguments != null) {
      categories = Get.arguments["categories"] ?? [];
      selectedCat = Get.arguments["selectedcat"];
      categoriesid = Get.arguments["categoriesid"];
    }
    getItems(categoriesid.toString());
  }

  @override
  changeCat(val, categoriesid) {
    selectedCat = val;
    getItems(categoriesid.toString());
    update();
  }

  @override
  getItems(categoriesid) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getAllItems(categoriesid);
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      items.addAll(response['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}
