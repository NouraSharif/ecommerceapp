import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/address_data.dart';
import 'package:ecommerceapp/data/model/addressmodel.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData();
  List<AddressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );

    print("================ RESPONSE =================");
    print(response);

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
    }

    update();
  }

  deleteAddress(String addressId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.deleteAddress(addressId);
    if (response['status'] == "success") {
      data.removeWhere((element) => element.addressId.toString() == addressId);
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
