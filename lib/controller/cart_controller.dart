import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/cartmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  CartData cartData = CartData();
  MyServices myServices = Get.find();

  StatusRequest? statusRequest;

  final List<CartModel> data = [];
  double totalprice = 0.0;
  int totalcount = 0;

  addToCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.add(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    Get.rawSnackbar(
      title: "Success",
      message: "Item Added to Cart",
      backgroundColor: AppColor.secondaryColor,
    );
    update();
    return response;
  }

  removeFromCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.remove(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    Get.rawSnackbar(
      title: "Success",
      message: "Item Remove From Cart",
      backgroundColor: AppColor.secondaryColor,
    );
    update();
    return response;
  }

  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.view(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      data.clear(); // مهم جدًا
      totalprice = 0;
      totalcount = 0;

      if (response['datacart'] != null && response['datacart'].isNotEmpty) {
        List dataresponse = response['datacart'];
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
      }

      if (response['countprice'] != null && response['countprice'] is Map) {
        Map countprice = response['countprice'];
        totalprice = double.parse(countprice['totalprice'].toString());
        totalcount = int.parse(countprice['totalcount'].toString());
      }

      update();
    }
  }

  resetPage() {
    totalprice = 0.0;
    totalcount = 0;
    data.clear();
    update();
  }

  refreshPage() {
    resetPage();
    viewCart();
    update();
  }

  @override
  void onInit() {
    viewCart();
    super.onInit();
  }
}
