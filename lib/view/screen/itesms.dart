import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/view/widget/customappbar.dart';
import 'package:ecommerceapp/view/widget/items/customlistitems.dart';
import 'package:ecommerceapp/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ListView(
          children: [
            CustomAppBar(
              onPressedSearch: () {},
              titleappBar: "Find Product",
              onPressed: () {},
            ),
            ListCategoriesItems(),
            CustomListItems(),
            // CustomListItems(),
            /* GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.items.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, i) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.images}/${controller.items[i]['items_image']}",
                        ),
                      ),
                      ListTile(
                        title: Text(
                          controller.items[i]['items_name'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "  200.50\$",
                              style: TextStyle(
                                color: AppColor.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
