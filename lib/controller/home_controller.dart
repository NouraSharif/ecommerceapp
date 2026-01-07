import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/homedata.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoriesid);
}

class HomeControllerImp extends HomeController {
  MyServices myservices = Get.find();

  HomeData homeData = HomeData();
  StatusRequest statusRequest = StatusRequest.none;
  List categories = [];
  List items = [];

  String? username;
  String? id;

  late String categoriesid;

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

  @override
  void onInit() {
    getdata();
    initialData();
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
}
