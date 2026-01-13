import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favorite/favoritedata.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData();
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  Map isFavorites = {};

  //id===عبارة عن معرف المنتج
  //favorite===عبارة عن حالة المفضلة 0 او 1
  void setFavorite(int itemsId, int favorite) {
    isFavorites[itemsId] = favorite;
    update();
  }

  addFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavorite(
      myservices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          title: "Success",
          message: "Item Added to Favorites",
          backgroundColor: AppColor.secondaryColor,
        );
      }
      update();
    } else {}
  }

  removeFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeFavorite(
      myservices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          backgroundColor: AppColor.secondaryColor,
          title: "Success",
          message: "Item Removed from Favorites",
        );
      }
      update();
    } else {}
  }
}
