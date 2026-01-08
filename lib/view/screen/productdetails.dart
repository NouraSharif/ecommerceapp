import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/productdetails/priceandcount.dart';
import 'package:ecommerceapp/view/widget/productdetails/subitemslist.dart';
import 'package:ecommerceapp/view/widget/productdetails/topproductpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(
      ProductDetailsControllerImp(),
    );
    return Scaffold(
      bottomNavigationBar: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: AppColor.secondaryColor,
          onPressed: () {},
          child: Text(
            "Add To Cart",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          TopProductPage(),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.itemsModel.itemsName!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primarycolor,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "${controller.itemsModel.itemsDesc}",

                  style: TextStyle(fontSize: 18, color: AppColor.grey),
                ),
                SizedBox(height: 15),
                PriceAndCount(
                  countnumber: "02",
                  price: "200.50",
                  onPressedadd: () {},
                  onPressedaddremove: () {},
                ),
                SizedBox(height: 15),
                Text(
                  "Color",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primarycolor,
                  ),
                ),

                SubItemsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
