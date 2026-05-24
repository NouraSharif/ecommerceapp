import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethod extends StatelessWidget {
  final String paymentmethod;
  final bool isactive;
  final void Function()? onTap;
  const CardPaymentMethod({
    super.key,
    required this.isactive,
    required this.paymentmethod,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isactive ? AppColor.secondaryColor : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          paymentmethod,
          style: TextStyle(color: isactive ? Colors.white : null),
        ),
      ),
    );
  }
}
