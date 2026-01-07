import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressedSearch;
  final String titleappBar;
  final void Function()? onPressed;
  const CustomAppBar({
    super.key,
    required this.onPressedSearch,
    required this.titleappBar,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.appbarcolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: titleappBar,
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(Icons.search),
                ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.appbarcolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.notifications_active_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
