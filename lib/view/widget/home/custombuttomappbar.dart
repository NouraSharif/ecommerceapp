import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;

  final Color? color;
  final Function()? onPressed;

  const CustomButtomAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder:
          (controller) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: MaterialButton(
              onPressed: onPressed,
              child: Column(
                children: [
                  Icon(icon, color: color),
                  Text(title, style: TextStyle(color: color)),
                ],
              ),
            ),
          ),
    );
  }
}
