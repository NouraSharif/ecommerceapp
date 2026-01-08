import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 14),
            child: Container(
              height: 58,
              width: 95,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    controller.subitems[index]['active'] == "1"
                        ? AppColor.primarycolor
                        : null,
                border: Border.all(color: AppColor.primarycolor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                controller.subitems[index]['name'],
                style: TextStyle(
                  color:
                      controller.subitems[index]['active'] == "1"
                          ? Colors.white
                          : AppColor.primarycolor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
