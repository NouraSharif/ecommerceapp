import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final double price;
  final String shipping;
  final String totalPrice;
  final void Function()? onPressed;
  const BottomNavigationBarCart({
    super.key,
    required this.price,
    required this.shipping,
    required this.totalPrice,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.symmetric(horizontal: 40),
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
              Text("Sipping", style: TextStyle(fontSize: 20)),
              Text(
                "$shipping\$",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          SizedBox(height: 30),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            color: AppColor.primarycolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: onPressed,
            child: Text(
              "Place Order",
              style: TextStyle(color: AppColor.appbarcolor, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
