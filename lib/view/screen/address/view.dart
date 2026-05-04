import 'package:ecommerceapp/controller/address/view_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.appbarcolor,
        title: const Text(
          'Address',
          style: TextStyle(color: AppColor.appbarcolor),
        ),
        backgroundColor: AppColor.primarycolor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primarycolor,
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: Icon(Icons.add, color: AppColor.appbarcolor),
      ),
      body: GetBuilder<ViewAddressController>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder:
                      (context, i) => CardAddress(
                        addressModel: controller.data[i],
                        onDelete: () {
                          controller.deleteAddress(
                            controller.data[i].addressId!.toString(),
                          );
                        },
                      ),
                ),
              ),
            ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({
    super.key,
    required this.addressModel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(addressModel.addressName!),
        subtitle: Text(
          "${addressModel.addressCity} - ${addressModel.addressStreet}",
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: Icon(Icons.delete_outline, color: AppColor.primarycolor),
        ),
      ),
    );
  }
}
