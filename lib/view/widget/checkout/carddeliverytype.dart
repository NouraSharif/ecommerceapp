import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CardDeliveryType extends StatelessWidget {
  final List<String> images = [AppImageAsset.delivery, AppImageAsset.drivethru];
  final List<String> titles = ["Delivery", "Drive Thru"];

  final String title;
  final String image;
  final bool isactive;
  final void Function()? onTap;

  CardDeliveryType({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
    required this.isactive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isactive ? AppColor.secondaryColor : null,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset(image, width: 90, height: 90),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                color: isactive ? Colors.white : null,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
