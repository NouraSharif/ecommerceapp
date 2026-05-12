import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      bottomNavigationBar: GetBuilder<CartController>(
        builder:
            (controller) => BottomNavigationBarCart(
              price: controller.totalprice,
              discount: controller.discount,
              totalPrice: controller.getTotalPrice().toString(),
              couponController: controller.couponController!,
              onApplyCoupon: controller.checkcoupon,
              shipping: 0,
            ),
      ),
      body: GetBuilder<CartController>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView(
                children: [
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
