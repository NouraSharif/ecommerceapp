import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressedSearch;
  final void Function()? onPressedfavorite;
  final void Function(String)? onChanged;

  final String titleappBar;
  final TextEditingController? myController;

  const CustomAppBar({
    super.key,
    required this.onPressedSearch,
    required this.titleappBar,
    required this.onPressedfavorite,
    required this.onChanged,
    required this.myController,
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
              controller: myController,
              onChanged: onChanged,
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
              onPressed: onPressedfavorite,
              icon: Icon(Icons.favorite_border),
            ),
          ),
        ),
      ],
    );
  }
}
