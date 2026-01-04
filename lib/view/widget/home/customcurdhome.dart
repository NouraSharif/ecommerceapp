import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCurdHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCurdHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.secondaryColor,
      ),
      clipBehavior: Clip.hardEdge, // لقص أي شيء خارج الحدود
      child: LayoutBuilder(
        builder: (context, constraints) {
          // constraints.maxWidth = عرض الكونتينر
          double circleSize =
              constraints.maxWidth * 0.4; // الدائرة 40% من عرض الكونتينر
          return Stack(
            children: [
              Center(
                child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  subtitle: Text(
                    body,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -circleSize * 0.15, // جزء من الدائرة خارج الكونتينر
                bottom: 10,
                child: Container(
                  height: circleSize,
                  width: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primarycolor,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
