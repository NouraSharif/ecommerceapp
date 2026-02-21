import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.appbarcolor,
        title: const Text(
          'Add New Address',
          style: TextStyle(color: AppColor.appbarcolor),
        ),
        backgroundColor: AppColor.primarycolor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primarycolor,
        onPressed: () {},
        child: Icon(Icons.add, color: AppColor.appbarcolor),
      ),
      body: const Center(child: Text('Welcome to AddressAdd')),
    );
  }
}
