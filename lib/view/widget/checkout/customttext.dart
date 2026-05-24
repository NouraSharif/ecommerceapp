import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String titletext;
  const TitleText({super.key, required this.titletext});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(
        titletext,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
