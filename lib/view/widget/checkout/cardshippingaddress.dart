import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShippingAddress extends StatelessWidget {
  final String address;
  final String streetaddress;
  final bool isactive;
  final void Function()? onTap;
  const CardShippingAddress({
    super.key,
    required this.isactive,
    required this.address,
    required this.streetaddress,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isactive ? AppColor.secondaryColor : null,
        child: ListTile(
          title: Text(
            address,
            style: TextStyle(
              color: isactive ? Colors.white : null,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            streetaddress,
            style: TextStyle(color: isactive ? Colors.white : null),
          ),
        ),
      ),
    );
  }
}
