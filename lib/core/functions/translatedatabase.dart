import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

translateDatabase(String columnar, String column) {
  MyServices myservices = Get.find();

  if (myservices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return column;
  }
}
