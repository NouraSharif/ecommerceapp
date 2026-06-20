import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final TextEditingController couponController;
  final void Function()? onApplyCoupon;
  final double price;
  final int discount;
  final int shipping;
  final String totalPrice;

  const BottomNavigationBarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.totalPrice,
    required this.couponController,
    required this.onApplyCoupon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder:
                (controller) =>
                    controller.couponmodel.couponName == null
                        ? Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: couponController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 3.1,
                                      horizontal: 7,
                                    ),
                                    hintText: "Coupon Code",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: MaterialButton(
                                  color: const Color.fromARGB(255, 11, 68, 109),
                                  onPressed: onApplyCoupon,
                                  child: Text(
                                    "Apply",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        : Column(
                          children: [
                            SizedBox(height: 38),
                            Text(
                              "Applied Coupon: ${controller.couponmodel.couponName}",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.primarycolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primarycolor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price", style: TextStyle(fontSize: 20)),
                    Text(
                      "$price\$",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.primarycolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount", style: TextStyle(fontSize: 20)),
                    Text(
                      "$discount",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.primarycolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping", style: TextStyle(fontSize: 20)),
                    Text(
                      '$shipping',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.primarycolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$totalPrice\$",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.primarycolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          MaterialButton(
            minWidth: 350,
            height: 50,
            color: AppColor.primarycolor,
            onPressed: () {
              controller.goToCheckout();
            },
            child: Text(
              "Order",
              style: TextStyle(
                color: AppColor.appbarcolor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
