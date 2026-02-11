import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/homedata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomeController extends SearchItems {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoriesid);
  /*
  checkSearch(String val);
  onSearchItems();
  */
}

class HomeControllerImp extends HomeController {
  MyServices myservices = Get.find();

  HomeData homeData = HomeData();
  StatusRequest statusRequest = StatusRequest.none;
  List categories = [];
  List items = [];

  // List searchItems = [];

  String? username;
  String? id;
  //bool isSearch = false;

  //TextEditingController? search;

  late String categoriesid;
  /*
  @override
  checkSearch(val) {
    if (val.isEmpty) {
      isSearch = false;
    }
    update();
  }

  @override
  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
  */

  @override
  initialData() async {
    username = myservices.sharedPreferences.getString("username");
    id = myservices.sharedPreferences.getString("id");
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      }
      update();
    } else {}
  }

  /*
  searchData() async {
    searchItems.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.search(search!.text);
    print("================================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        searchItems.addAll(response['data']);
      }
      update();
    } else {}
  }
  */
  @override
  void onInit() {
    getdata();
    initialData();
    // search = TextEditingController();
    super.onInit();
  }

  @override
  goToItems(categories, selectedCat, categoriesid) {
    Get.toNamed(
      AppRoute.items,
      arguments: {
        "categories": categories,
        "selectedcat": selectedCat,
        "categoriesid": categoriesid,
      },
    );
  }

  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}

class SearchItems extends GetxController {
  List searchItems = [];
  bool isSearch = false;
  TextEditingController? search;

  HomeData homeData = HomeData();
  StatusRequest statusRequest = StatusRequest.none;

  checkSearch(val) {
    if (val.isEmpty) {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    searchItems.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.search(search!.text);
    print("================================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        searchItems.addAll(response['data']);
      }
      update();
    } else {}
  }

  @override
  onInit() {
    search = TextEditingController();
    super.onInit();
  }
}
