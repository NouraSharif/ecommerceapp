import 'dart:async';

import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;

  /*
  كنت حاطاهم بالاول بعدها currentlocation تدد بناء عليها
  او من الاعدادات location
  = CameraPosition(
    target: LatLng(31.2969, 34.2436),
    zoom: 14.4746,
  );
  */
  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarker(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToaddaressdetail() async {
    if (lat == null || long == null) {
      Get.snackbar("تنبيه", "حدد موقع على الخريطة أولاً");
      return;
    }
    Get.toNamed(
      AppRoute.adddetailsaddress,
      arguments: {"lat": lat, "long": long},
    );
  }

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }
}
