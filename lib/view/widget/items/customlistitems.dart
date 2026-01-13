import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite/favorite_controller.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class CustomListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteController controllerfav = Get.put(FavoriteController());
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.items.isEmpty) {
          return const Center(child: Text("لا توجد منتجات"));
        }

        return GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: controller.items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, i) {
            controllerfav.isFavorites.addAll({
              controller.items[i]['items_id']: controller.items[i]['favorite'],
            });
            return ListItems(
              itemsModel: ItemsModel.fromJson(controller.items[i]),
            );
          },
        );
      },
    );
  }
}

class ListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const ListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerfav = Get.find();
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 11.0),
                child: Hero(
                  tag: itemsModel.itemsId!,
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.images}/${itemsModel.itemsImage}",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(itemsModel.itemsName!, textAlign: TextAlign.center),
            ),
            Row(
              children: [
                Text(
                  "     Rating",
                  style: TextStyle(
                    color: AppColor.primarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 40),
                ...List.generate(
                  4,
                  (index) => Icon(Icons.star, color: Colors.amber),
                ),
              ],
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
                  GetBuilder<FavoriteController>(
                    builder:
                        (controller) => IconButton(
                          onPressed: () {
                            if (controllerfav.isFavorites[itemsModel.itemsId] ==
                                0) {
                              controllerfav.setFavorite(itemsModel.itemsId!, 1);
                              controllerfav.addFavorite(
                                itemsModel.itemsId.toString(),
                              );
                            } else {
                              controllerfav.setFavorite(itemsModel.itemsId!, 0);
                              controllerfav.removeFavorite(
                                itemsModel.itemsId.toString(),
                              );
                            }
                          },
                          icon: Icon(
                            controllerfav.isFavorites[itemsModel.itemsId] == 1
                                ? Icons.favorite_outlined
                                : Icons.favorite_border,
                            color: AppColor.secondaryColor,
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
