import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class TopProductPage extends GetView<ProductDetailsControllerImp> {
  const TopProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: Get.width / 6,
          left: Get.width / 6,
          child: CachedNetworkImage(
            height: 190,
            imageUrl: "${AppLink.images}/${controller.itemsModel.itemsImage}",
          ),
        ),
      ],
    );
  }
}
