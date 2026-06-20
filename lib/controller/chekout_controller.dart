import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/datasource/remote/checkout_data.dart';
import 'package:ecommerceapp/data/model/addressmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CheckoutController extends GetxController {
  String? paymentMethod;
  String? deliveryType;
  String? addressId;

  late String couponId;
  late double totalPrice;
  String pricedelivery = "25";

  late String discount;

  StatusRequest statusRequest = StatusRequest.none;

  AddressModel addressModel = AddressModel();
  AddressData addressData = AddressData();

  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  CheckoutData checkoutData = CheckoutData();
  MyServices myservices = Get.find();

  void choosePaymentMethod(String type) {
    paymentMethod = type;
    update();
  }

  void chooseDeliveryType(String type) {
    deliveryType = type;
    update();
  }

  void chooseShippingAddress(String type) {
    addressId = type;
    update();
  }

  addressView() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  checkout() async {
    if (deliveryType == null || paymentMethod == null) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Please select all options",
      );
      return;
    }
    if (deliveryType == '0' && addressId == null) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Please select a shipping address",
      );
      return;
    }

    Map data = {
      'usersid': myservices.sharedPreferences.getString("id")!,
      'addressid': addressId ?? "0",
      'orderstype': deliveryType!,
      'couponid': couponId,
      'paymentmethod': paymentMethod!,
      'ordersprice': totalPrice.toString(),
      'pricedelivery': pricedelivery,
      'discountcoupon': discount.toString(),
    };

    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.checkout(data);
    print('============================$response');
    print(data);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
        Get.snackbar("Success", "Order placed successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.defaultDialog(
          title: "Warning",
          middleText: "Please choose all options",
        );
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'] ?? "0";
    totalPrice = Get.arguments['totalprice'];
    discount = Get.arguments['discount'].toString();
    addressView();
    super.onInit();
  }
}
