import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String texttitle;
  const CustomTextTitleAuth({super.key, required this.texttitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      texttitle,
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );
  }
}
