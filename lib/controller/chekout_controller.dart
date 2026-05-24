import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/model/addressmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CheckoutController extends GetxController {
  String? paymentMethod;
  String? deliveryType;
  String? addressId;

  StatusRequest statusRequest = StatusRequest.none;

  AddressModel addressModel = AddressModel();
  AddressData addressData = AddressData();

  MyServices myServices = Get.find();
  List<AddressModel> data = [];

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

  @override
  void onInit() {
    addressView();
    super.onInit();
  }
}
