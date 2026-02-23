import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/view/widget/cart/appbarcart.dart';
import 'package:ecommerceapp/view/widget/cart/custombottomvavigationcart.dart';
import 'package:ecommerceapp/view/widget/cart/customitemscartlist.dart';
import 'package:ecommerceapp/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetBuilder<CartController>(
      builder:
          (controller) => Scaffold(
            bottomNavigationBar: BottomNavigationBarCart(
              price: controller.totalprice,
              shipping: "50",
              totalPrice:
                  controller.totalprice == 0
                      ? "0"
                      : "${controller.totalprice + 50}",
              onPressed: () {},
            ),
            body: HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView(
                children: [
                  TopApparCart(title: "My Cart"),
                  TopCardCart(itemscount: controller.totalcount),
                  SizedBox(height: 20),
                  ...List.generate(
                    controller.data.length,
                    (index) => CustomItemsCartList(
                      itemsname: controller.data[index].itemsName.toString(),
                      itemsprice: controller.data[index].itemsprice ?? 0.0,
                      itemscount: controller.data[index].countitems ?? 0,
                      imagename: controller.data[index].itemsImage.toString(),
                      onAdd:
                          controller.statusRequest == StatusRequest.loading
                              ? null
                              : () async {
                                await controller.addToCart(
                                  controller.data[index].itemsId.toString(),
                                );
                                controller.refreshPage();
                              },
                      onRemove:
                          controller.statusRequest == StatusRequest.loading
                              ? null
                              : () async {
                                await controller.removeFromCart(
                                  controller.data[index].itemsId.toString(),
                                );
                                controller.refreshPage();
                              },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
