import 'package:ecommerceapp/controller/address/adddetails_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/shared/custombutton.dart';
import 'package:ecommerceapp/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class AddDetailsAddress extends StatelessWidget {
  const AddDetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDetailsAddressController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add Details Address ')),
      body: GetBuilder<AddDetailsAddressController>(
        builder:
            (controller) => Padding(
              padding: const EdgeInsets.only(top: 40),
              child: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    CustomTextFormAuth(
                      hinttext: "city",
                      labeltext: "City",
                      icondata: Icons.location_city,
                      mycontroller: controller.city,
                      validator: (value) {
                        return;
                      },
                    ),
                    CustomTextFormAuth(
                      hinttext: "street",
                      labeltext: "street",
                      icondata: Icons.streetview,
                      mycontroller: controller.street,
                      validator: (value) {
                        return;
                      },
                    ),
                    CustomTextFormAuth(
                      hinttext: "name",
                      labeltext: "name",
                      icondata: Icons.near_me,
                      mycontroller: controller.name,
                      validator: (value) {
                        return;
                      },
                    ),
                    CustomButton(
                      onPressed: () {
                        controller.addAddress();
                      },
                      text: "Add",
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
