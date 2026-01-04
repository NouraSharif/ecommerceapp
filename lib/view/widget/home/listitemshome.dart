import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {},
            child: Items(itemsmodel: ItemsModel.fromJson(controller.items[i])),
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsmodel;
  const Items({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 300,
              height: 180,
              child: Image.network(
                "${AppLink.images}/${itemsmodel.itemsImage}",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SALE في المنتصف ومائلة
          Transform.rotate(
            angle: -0.3, // الميلان
            child: Text(
              "SALE",
              style: TextStyle(
                color: Colors.red,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Shadow(
                    offset: Offset(-2, -2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
