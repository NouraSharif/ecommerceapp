import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite/myfavorite_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/data/model/myfavoritemodel.dart';
import 'package:ecommerceapp/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteControllerImp> {
  const CustomListFavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteControllerImp>(
      builder: (controller) {
        if (controller.data.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text(
                "No items in your favorites",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        return GridView.builder(
          itemCount: controller.data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, i) {
            return MyFavoriteItems(
              myFavoriteModel: MyFavoriteModel.fromJson(controller.data[i]),
            );
          },
        );
      },
    );
  }
}

// ignore: must_be_immutable
class MyFavoriteItems extends GetView<MyFavoriteControllerImp> {
  MyFavoriteModel myFavoriteModel;

  MyFavoriteItems({super.key, required this.myFavoriteModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 11.0),
              child: CachedNetworkImage(
                imageUrl: "${AppLink.images}/${myFavoriteModel.itemsImage}",
                fit: BoxFit.contain,
                errorWidget: (context, url, error) => Icon(Icons.error),
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
              ),
            ),
          ),

          ListTile(
            title: Text(
              myFavoriteModel.itemsName!,
              textAlign: TextAlign.center,
            ),
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
                  "${myFavoriteModel.itemsPrice}\$",
                  style: TextStyle(
                    color: AppColor.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.deletefromfavorite(
                      myFavoriteModel.favoriteId.toString(),
                    );
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: AppColor.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
