import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() ontap;
  const CustomTextSignUpOrSignIn({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: ontap,
          child: Text(
            texttwo,
            style: TextStyle(
              color: AppColor.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
