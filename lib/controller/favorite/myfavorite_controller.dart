import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/handlingdata.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/favorite/myfavoritedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

abstract class Myfavorite extends SearchItems {
  getData();
  deletefromfavorite(String favoriteid);
}

class MyFavoriteControllerImp extends Myfavorite {
  MyFavoriteData myfavoritedata = MyFavoriteData();

  MyServices myServices = Get.find();

  List data = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myfavoritedata.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        /* var responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("=======================$data");
        */
        data.addAll(response['data']);
      }
      update();
    } else {}
  }

  //بدون async&await
  //للحذف مباشرة وبالتالي السرعة في اداء الابليكشن
  @override
  deletefromfavorite(String favoriteid) async {
    // حذف فوري من الواجهة
    data.removeWhere(
      (element) => element['favorite_id'].toString() == favoriteid,
    );
    update();

    // طلب الحذف من السيرفر (خلف الكواليس)
    await myfavoritedata.deletefromfavorite(favoriteid);
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
