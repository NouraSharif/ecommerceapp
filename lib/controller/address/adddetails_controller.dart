import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddDetailsAddressController extends GetxController {
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? name;

  double? latitude;
  double? longitude;

  AddressData addressData = AddressData();
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addAddress(
      myServices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
      latitude!.toString(),
      longitude.toString(),
    );

    print("================ RESPONSE =================");
    print(response);

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  intialData() {
    latitude = Get.arguments['lat'];
    longitude = Get.arguments['long'];
    print("==================================");
    print("Latitude: $latitude, Longitude: $longitude");
  }

  @override
  void onInit() {
    city = TextEditingController();
    street = TextEditingController();
    name = TextEditingController();
    super.onInit();
    intialData();
  }
}
