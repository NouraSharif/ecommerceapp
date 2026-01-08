import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  @override
  void onInit() {
    initialData();
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
}
