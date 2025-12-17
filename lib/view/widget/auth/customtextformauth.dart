import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final IconData icondata;
  final TextEditingController? mycontroller;
  final String? Function(String?) validator;
  final bool? isNumber;
  final bool? obscureText;
  final void Function()? onTap;
  const CustomTextFormAuth({
    super.key,
    this.isNumber,
    this.obscureText,
    this.onTap,
    required this.labeltext,
    required this.hinttext,
    required this.icondata,
    required this.mycontroller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(bottom: 25),
      child: TextFormField(
        keyboardType:
            isNumber == true
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
        obscureText: obscureText ?? false,
        validator: validator,
        controller: mycontroller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, top: 20),
          label: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(labeltext),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hinttext,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          suffixIcon: InkWell(onTap: onTap, child: Icon(icondata)),
        ),
      ),
    );
  }
}
