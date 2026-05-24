import 'package:ecommerceapp/controller/chekout_controller.dart';
import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/view/widget/checkout/cardshippingaddress.dart';
import 'package:ecommerceapp/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommerceapp/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommerceapp/view/widget/checkout/customttext.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: MaterialButton(
          height: 50,
          onPressed: () {},
          color: AppColor.primarycolor,
          child: Text(
            'Checkout',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GetBuilder<CheckoutController>(
          builder:
              (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    TitleText(titletext: 'Choose Payment Method :'),
                    CardPaymentMethod(
                      isactive:
                          controller.paymentMethod == 'Cash On Delivery'
                              ? true
                              : false,
                      paymentmethod: 'Cash On Delivery',
                      onTap: () {
                        controller.choosePaymentMethod('Cash On Delivery');
                      },
                    ),
                    CardPaymentMethod(
                      isactive:
                          controller.paymentMethod == 'Payment Cards'
                              ? true
                              : false,
                      paymentmethod: 'Payment Cards',
                      onTap: () {
                        controller.choosePaymentMethod('Payment Cards');
                      },
                    ),
                    SizedBox(height: 15),
                    TitleText(titletext: 'Choose Delivery Type :'),
                    Row(
                      children: [
                        CardDeliveryType(
                          title: 'Delivery',
                          image: AppImageAsset.delivery,
                          isactive:
                              controller.deliveryType == 'Delivery'
                                  ? true
                                  : false,
                          onTap: () {
                            controller.chooseDeliveryType('Delivery');
                            controller.addressView();
                          },
                        ),
                        SizedBox(width: 10),
                        CardDeliveryType(
                          title: 'Revice',
                          image: AppImageAsset.drivethru,
                          isactive:
                              controller.deliveryType == 'Recive'
                                  ? true
                                  : false,
                          onTap: () {
                            controller.chooseDeliveryType('Revice');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    if (controller.deliveryType == 'Delivery')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(titletext: 'Shipping Address :'),
                          ...List.generate(
                            controller.data.length,
                            (index) => CardShippingAddress(
                              isactive:
                                  controller.addressId ==
                                          "${controller.data[index].addressId}"
                                      ? true
                                      : false,
                              onTap: () {
                                controller.chooseShippingAddress(
                                  "${controller.data[index].addressId}",
                                );
                              },
                              address: controller.data[index].addressName!,
                              streetaddress:
                                  "${controller.data[index].addressCity!} - ${controller.data[index].addressStreet!}",
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
