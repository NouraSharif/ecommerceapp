import 'package:ecommerceapp/controller/address/add_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.appbarcolor,
        title: const Text(
          'Add New Address',
          style: TextStyle(color: AppColor.appbarcolor),
        ),
        backgroundColor: AppColor.primarycolor,
      ),

      body: GetBuilder<AddAddressController>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget:
                  controller.kGooglePlex != null
                      ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: controller.kGooglePlex!,
                            onTap: (LatLng latLng) {
                              controller.addMarker(latLng);
                            },
                            markers: controller.markers.toSet(),
                          ),
                          MaterialButton(
                            minWidth: 300,
                            color: const Color.fromARGB(255, 5, 55, 91),
                            onPressed: () {
                              controller.goToaddaressdetail();
                            },
                            child: Text(
                              "اكمال",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                      : const Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}
