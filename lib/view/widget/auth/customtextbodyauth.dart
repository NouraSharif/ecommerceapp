import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textbody;
  const CustomTextBodyAuth({super.key, required this.textbody});

  @override
  Widget build(BuildContext context) {
    return Text(
      textbody,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
