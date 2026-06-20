import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/orders/pending_data.dart';
import 'package:ecommerceapp/data/model/ordersmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrdersPendingController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  OrdersPendingData ordersPendingData = OrdersPendingData();
  MyServices myservices = Get.find();

  List<OrdersModel> ordersPendingList = [];

  String printOrderType(int val) {
    if (val == 0) {
      return "recive";
    } else {
      return "delivery";
    }
  }

  String printPaymentMethod(int val) {
    if (val == 0) {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(int val) {
    if (val == 0) {
      return "Pending approval";
    } else if (val == 1) {
      return "The order is being prepare";
    } else if (val == 2) {
      return "On the way";
    } else {
      return "archive";
    }
  }

  getOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.ordersPending(
      myservices.sharedPreferences.getString("id")!,
    );
    print("======================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        ordersPendingList.clear();
        List data = response['data'];
        ordersPendingList.addAll(data.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
