import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  final void Function()? onPressedadd;
  final void Function()? onPressedaddremove;
  final String countnumber;
  final String price;
  const PriceAndCount({
    super.key,
    required this.onPressedadd,
    required this.onPressedaddremove,
    required this.countnumber,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onPressedadd, icon: Icon(Icons.add)),
            Container(
              width: 40,
              height: 30,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primarycolor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                countnumber,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(onPressed: onPressedaddremove, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        Text(
          "$price\$",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.blue,
          ),
        ),
      ],
    );
  }
}
