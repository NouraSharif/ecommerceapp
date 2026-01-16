import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomAppBar extends StatelessWidget {
  final IconData icon;

  final Color? color;
  final Function()? onPressed;

  const CustomButtomAppBar({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder:
          (controller) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: IconButton(
              alignment: Alignment.center,
              onPressed: onPressed,
              icon: Icon(icon, color: color, size: 28),
            ),
          ),
    );
  }
}
