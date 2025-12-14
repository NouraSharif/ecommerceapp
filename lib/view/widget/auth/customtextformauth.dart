import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final IconData icondata;
  final TextEditingController? mycontroller;
  const CustomTextFormAuth({
    super.key,
    required this.labeltext,
    required this.hinttext,
    required this.icondata,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(bottom: 25),
      child: TextFormField(
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
          suffixIcon: Icon(icondata),
        ),
      ),
    );
  }
}
